# Компилятор и флаги
CXX      := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -Werror

# Директории
SRC_DIR := src
BIN_DIR := bin

# Автоматическое определение исходных файлов
SOURCES := $(wildcard $(SRC_DIR)/point[1-4].cpp)
TARGETS := $(SOURCES:$(SRC_DIR)/%.cpp=$(BIN_DIR)/%)

# Основные цели
.PHONY: all clean rebuild help run_point1 run_point2 run_point3 run_point4 run_all report clean-report

all: $(TARGETS)

# Сборка исполняемых файлов (каждая программа компилируется отдельно)
$(BIN_DIR)/%: $(SRC_DIR)/%.cpp
	@mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $< -o $@

# Запуск отдельных программ
run_point1: $(BIN_DIR)/point1
	@echo "=== Запуск программы определения знака числа (if/else) ==="
	@./$(BIN_DIR)/point1

run_point2: $(BIN_DIR)/point2
	@echo "=== Запуск программы суммы массива (for) ==="
	@./$(BIN_DIR)/point2

run_point3: $(BIN_DIR)/point3
	@echo "=== Запуск программы распределения по командам (switch) ==="
	@./$(BIN_DIR)/point3

run_point4: $(BIN_DIR)/point4
	@echo "=== Запуск программы вывода частичных сумм (do while) ==="
	@./$(BIN_DIR)/point4

# Запуск всех программ по очереди
run_all: $(TARGETS)
	@echo "=== Запуск всех программ ==="
	@for prog in $(TARGETS); do \
		echo "--- Запуск $$(basename $$prog) ---"; \
		./$$prog; \
		echo ""; \
	done

# Сборка отчёта (требуется XeLaTeX)
report: report/lab3.pdf

report/lab3.pdf: report/lab3.tex
	cd report && xelatex lab3.tex && xelatex lab3.tex

# Очистка временных файлов LaTeX
clean-report:
	if [ -d report ]; then cd report && rm -f *.aux *.log *.out *.toc *.synctex.gz *.fls *.fdb_latexmk; fi

# Очистка сгенерированных файлов проекта
clean: clean-report
	rm -rf $(BIN_DIR)

# Полная пересборка
rebuild: clean all

# Справка
help:
	@echo "Доступные цели:"
	@echo "  all          - сборка всех программ (по умолчанию)"
	@echo "  run_point1   - запуск программы определения знака числа (if/else)"
	@echo "  run_point2   - запуск программы суммы массива (for)"
	@echo "  run_point3   - запуск программы распределения по командам (switch)"
	@echo "  run_point4   - запуск программы вывода частичных сумм (do while)"
	@echo "  run_all      - запуск всех программ по очереди"
	@echo "  report       - сборка отчёта из LaTeX (требуется XeLaTeX)"
	@echo "  clean        - удаление исполняемых файлов и временных файлов LaTeX"
	@echo "  rebuild      - полная пересборка (clean + all)"
	@echo "  help         - показать эту справку"