Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA58417E3
	for <loongarch@lists.linux.dev>; Thu, 15 Dec 2022 04:02:17 +0000 (UTC)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8BxGelFnJpj2bkFAA--.9724S3;
	Thu, 15 Dec 2022 12:02:13 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxtOVDnJpjVBkAAA--.887S2;
	Thu, 15 Dec 2022 12:02:13 +0800 (CST)
From: Jinyang He <hejinyang@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Qing Zhang <zhangqing@loongson.cn>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 0/6] LoongArch: Some fix and new features for unwinders
Date: Thu, 15 Dec 2022 12:01:35 +0800
Message-Id: <20221215040141.18610-1-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxtOVDnJpjVBkAAA--.887S2
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrZry8trWxCr15GFW3XrWxCrg_yoWDCwbEgF
	yfAa4UGrWkWa98J3WDtryfJ34UWa1vqF90kas8ZrWxAFn0yF1rJrsxJw1av34vgrWUXrs8
	J3y0g3ZY9w1qvjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	17kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJV
	W8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU

Make the stacktrace more effective and the codes more clear.

Jinyang He (6):
  LoongArch: Get frame info in unwind_start when regs is not supported
  LoongArch: Use correct sp value to get graph addr in unwinder guess
  LoongArch: Adjust PC value when unwind next frame in prologue unwinder
  LoongArch: Strip guess_unwinder out from prologue_unwinder
  LoongArch: Add raw_show_trace to enable guess unwinder default
  LoongArch: Add generic ex-handler unwind in prologue unwinder

 arch/loongarch/include/asm/ftrace.h     |   2 -
 arch/loongarch/include/asm/unwind.h     |  33 +++-
 arch/loongarch/kernel/Makefile          |   3 +-
 arch/loongarch/kernel/genex.S           |   3 +
 arch/loongarch/kernel/process.c         |  12 +-
 arch/loongarch/kernel/unwind.c          |  52 +++++
 arch/loongarch/kernel/unwind_guess.c    |  45 ++---
 arch/loongarch/kernel/unwind_prologue.c | 248 +++++++++++++++---------
 arch/loongarch/mm/tlb.c                 |   2 +-
 9 files changed, 256 insertions(+), 144 deletions(-)
 create mode 100644 arch/loongarch/kernel/unwind.c

-- 
2.34.3

