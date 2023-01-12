Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D256D37B
	for <loongarch@lists.linux.dev>; Thu, 12 Jan 2023 00:37:02 +0000 (UTC)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8DxSuomVr9j0hIBAA--.3199S3;
	Thu, 12 Jan 2023 08:36:54 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxbL4kVr9jLyEYAA--.43573S2;
	Thu, 12 Jan 2023 08:36:54 +0800 (CST)
From: Jinyang He <hejinyang@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Qing Zhang <zhangqing@loongson.cn>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 0/5] LoongArch: Some fix and new features for unwinders
Date: Thu, 12 Jan 2023 08:36:22 +0800
Message-Id: <20230112003627.26111-1-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxbL4kVr9jLyEYAA--.43573S2
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7WrWruFWxWry3Ww1xKw4kWFg_yoW8Gr1xp3
	yfuFnxXr4rKr9Fqr9Fyw15ur1DJr97G3yaqanIqry8GF12qr17Zr1FvryDZF98t3y8G3y0
	qrn5G3yjgayDtaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b78YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_Gr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

Make the stacktrace more effective and the codes more clear.

v3:
  Make unwind_{guess,prologue}.c as frontend and share unwind.c.
  Drop unwind ops and reenable unwind type for clear logic.

v2:
  Directly use unwinder_guess when register unwinder.
  Drop unwind type.
  Drop patch which add raw_show_trace parameter.
  Handle task == NULL case in unwind_start.

  Thanks for Qing and Huacai.

Jinyang He (5):
  LoongArch: Get frame info in unwind_start when regs is not supported
  LoongArch: Use correct sp value to get graph addr in unwinder guess
  LoongArch: Adjust PC value when unwind next frame in prologue unwinder
  LoongArch: Strip guess_unwinder out from prologue_unwinder
  LoongArch: Add generic ex-handler unwind in prologue unwinder

 arch/loongarch/include/asm/ftrace.h     |   2 -
 arch/loongarch/include/asm/unwind.h     |  40 +++-
 arch/loongarch/kernel/Makefile          |   2 +-
 arch/loongarch/kernel/genex.S           |   3 +
 arch/loongarch/kernel/process.c         |  12 +-
 arch/loongarch/kernel/traps.c           |   3 -
 arch/loongarch/kernel/unwind.c          |  33 ++++
 arch/loongarch/kernel/unwind_guess.c    |  49 +----
 arch/loongarch/kernel/unwind_prologue.c | 247 ++++++++++++++----------
 arch/loongarch/mm/tlb.c                 |   2 +-
 10 files changed, 232 insertions(+), 161 deletions(-)
 create mode 100644 arch/loongarch/kernel/unwind.c

-- 
2.34.3

