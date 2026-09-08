Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73F03A1D05
	for <loongarch@lists.linux.dev>; Tue,  8 Sep 2026 07:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853873; cv=none; b=qI2zfsyy/teJK3W1z9JnZC0OK3RxlTe6VQUmuzcjbGYFxyjERn5zgKTEkcQfElLFruOWaRzQoUDZ4priF797gU/aYMCqkKb/JRcGFqL+YFbz0GXLu1x9c0jao193XngNRwGnUIEgy9bUsNNV60ZpieN/I/qfXDkB3SeW1yzsPEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853873; c=relaxed/simple;
	bh=LoTeSF2Sp5RJBvRuP5z73LifGbx6GY6oYSFnURWYf3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kPQovLr3SfTjrmKKOryi46bg9RFGGS4VeOqiCzqtu5krM4gV8JiOwvQiwFN70dqb0Bd+QCMlpBb6dgc3U6Fnbx0jRLXCtzjlE0Tc/+TWTbF3gFm05V5FADZ2mM1O5eAT/co//fUgCs5QGlxzl6fIGqPrMsjRrZRVkded4dVgyNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxHNJsvp9q_bgJAA--.27865S3;
	Tue, 08 Sep 2026 15:51:08 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJBx5cxrvp9qVRAdAA--.35215S4;
	Tue, 08 Sep 2026 15:51:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] LoongArch: Remove redundant call in update_bp_registers()
Date: Tue,  8 Sep 2026 15:51:02 +0800
Message-ID: <20260908075106.5039-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260908075106.5039-1-yangtiezhu@loongson.cn>
References: <20260908075106.5039-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBx5cxrvp9qVRAdAA--.35215S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw4xKw1DKw1UXFWxAw4UWrX_yoW8JFWxpr
	yY9FZ5Kr4DGF4kC3ZrKF93ZryUGF9ru392vw4Fkay3twnxWr1rJ34UW3s3XFWYvw4fK34I
	grW5CFyYq3WUAacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

In update_bp_registers(), there is a duplicate call to write_wb_reg()
when enabling an execute breakpoint:

    write_wb_reg(CSR_CFG_CTRL, i, 0, CTRL_PLV_ENABLE);
    write_wb_reg(CSR_CFG_CTRL, i, 0, CTRL_PLV_ENABLE);

The two lines are completely identical. Remove the redundant call to
clean up the code and eliminate unnecessary register writes.

Fixes: edffa33c7bb5 ("LoongArch: Add hardware breakpoints/watchpoints support")
Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/hw_breakpoint.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index 6ba7315852f3..bd891b3808a6 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -453,7 +453,6 @@ static void update_bp_registers(struct pt_regs *regs, int enable, int type)
 		if (enable) {
 			if ((info->ctrl.type == LOONGARCH_BREAKPOINT_EXECUTE) && (type == 0)) {
 				write_wb_reg(CSR_CFG_CTRL, i, 0, CTRL_PLV_ENABLE);
-				write_wb_reg(CSR_CFG_CTRL, i, 0, CTRL_PLV_ENABLE);
 			} else {
 				ctrl = read_wb_reg(CSR_CFG_CTRL, i, 1);
 				if (info->ctrl.type == LOONGARCH_BREAKPOINT_LOAD)
-- 
2.42.0

