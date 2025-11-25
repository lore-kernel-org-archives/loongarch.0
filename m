Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0452928DF07
	for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 06:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764052440; cv=none; b=GxuULFozwv7iuhQcn4QshzC0lte5UgCv9ykdSpUFFMkXzgqequl4y4wNiQp3hZ5x/6T5g3bokFXrshkxnJJ2+MLfHPaUjOY7rQqeeXIOxcTO3Frzpq4yZUH7VHmM+X61hT+o+/xP+R4cAK7bFeDL25fPtyuBWrIqvheHSt2y15w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764052440; c=relaxed/simple;
	bh=itml4WuMwKy7zy/ENIm4fPju3xgWXyBBNowvVqsOXd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ghg4L3MbkYHFE+AKjewReH+eB6ktWzjdvxkEahp0lbQMtr8zhl7eHZPLU1FyL4miy5+Wh67jB+RV2N/3xcNkqOHliv7cWA34JT9Hi4a0x0wkkwnW6DMdZD4iseAL3ruWUdt+iw0YmOhiZTLOAbT9STQWePy/ctWKYr9WkfodyP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Axz9PJTSVp18gnAA--.14863S3;
	Tue, 25 Nov 2025 14:33:45 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDx_8PGTSVpc2w+AQ--.40949S2;
	Tue, 25 Nov 2025 14:33:43 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Zhang <zhangxi@kylinos.cn>,
	Xianglai Li <lixianglai@loongson.cn>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] LoongArch: Handle special PC in unwind_next_frame()
Date: Tue, 25 Nov 2025 14:33:27 +0800
Message-ID: <20251125063327.31586-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDx_8PGTSVpc2w+AQ--.40949S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kry3Gr1rtF1kWrWxAw1rKrX_yoW8KrWxpF
	yDArn5Kr48GF90qa4DC34xuryDXw4DG34agasrt34ruFn0v3W3Xw10vwnrZa1qq3yvgayI
	qF95Cry2kayUAabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

When running virtual machine before testing the kernel live patching with
"modprobe livepatch-sample", there is a timeout over 15 seconds, the dmesg
command shows "unreliable stack" for user tasks in debug mode.

The "unreliable stack" is because it can not unwind from kvm_handle_exit()
to its previous frame kvm_exc_entry() due to the PC is not a valid kernel
address, the root cause is that the code of kvm_exc_entry() was copied to
the DMW area in kvm_loongarch_env_init(), so it should check the PC range
and then finish unwinding for this special case.

How to test:

(1) Update kernel with LIVEPATCH

  git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  cd linux && make mrproper defconfig
  scripts/config -e FTRACE -e FUNCTION_TRACER \
  -e LIVEPATCH -e SAMPLES -m SAMPLE_LIVEPATCH
  make olddefconfig all -j"$(nproc)"
  sudo make modules_install
  sudo make install
  sudo reboot

(2) Set up a VM with "-accel kvm", no need to specify kernel and initrd

  sudo yum -y install edk2-loongarch64 qemu
  qemu-system-loongarch64 -serial stdio \
  -machine virt -cpu la464 -smp 8 -m 4G \
  -bios /usr/share/edk2/loongarch64/QEMU_EFI.fd \
  -nodefaults -no-reboot -nographic -accel kvm

(3) Test the kernel live patching

  cat /proc/cmdline
  sudo modprobe livepatch-sample
  cat /proc/cmdline
  sudo sh -c "echo 0 > /sys/kernel/livepatch/livepatch_sample/enabled"
  sudo rmmod livepatch_sample
  cat /proc/cmdline
  dmesg -T

Cc: stable@vger.kernel.org # v6.9+
Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
Reported-by: Xi Zhang <zhangxi@kylinos.cn>
Reported-by: Xianglai Li <lixianglai@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/unwind_orc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/unwind_orc.c
index 0d5fa64a2225..1d60a593479a 100644
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -506,6 +506,9 @@ bool unwind_next_frame(struct unwind_state *state)
 		goto err;
 	}
 
+	if (pc >= (unsigned long)_end && pc < (unsigned long)XKVRANGE)
+		goto end;
+
 	state->pc = bt_address(pc);
 	if (!state->pc) {
 		pr_err("cannot find unwind pc at %p\n", (void *)pc);
-- 
2.42.0

