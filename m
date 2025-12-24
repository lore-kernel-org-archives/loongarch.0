Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF0D315D28
	for <loongarch@lists.linux.dev>; Wed, 24 Dec 2025 10:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766572543; cv=none; b=B5tXQG3CpfsKNeXgluPUu1W4PlSpzmrn1bjLQzrf8n3MXF3zz88klfHkXS1/3CUGfsEzja40vwqK3fNLcvNG8nzn++JSnekqx6MArzHrXOH0ZwOyxXf0D0RVc3jWw7HaJx7QPOvPbqpihCAvcbsj121J0rEP7/rGGGnhnjJNHLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766572543; c=relaxed/simple;
	bh=AWRVvnKEmSUZnHEvNJN2IWpVLf0E7LxRWH/NCMD2bTg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bLTMBq20tun+OOBpx7/V2Ydm8Gv1wljHq7rDc0YrVazcmrezMeQTXmXBtKUktkIm3fKr/jCOkinoLlDhJD2l2EKxrx3ZnshM1jAeHrWP9RR2KMAHL27Z1gM6pCvzmzmmk4X/KWuvwra6XvSyiMyWU0vMox1XyL/ac/BlF6atUlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxVvD1wUtp17kCAA--.9231S3;
	Wed, 24 Dec 2025 18:35:34 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCx2+D0wUtpGjsEAA--.13037S2;
	Wed, 24 Dec 2025 18:35:33 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] LoongArch: Refine entry points code for ORC unwinder
Date: Wed, 24 Dec 2025 18:35:14 +0800
Message-ID: <20251224103516.12654-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx2+D0wUtpGjsEAA--.13037S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1YL9UUUUU=

The changes were in the previous patches, this series is based on 6.19-rc2.

Tiezhu Yang (2):
  LoongArch: Use UNWIND_HINT_END_OF_STACK for entry points
  LoongArch: Remove is_entry_func() and kernel_entry_end

 arch/loongarch/kernel/head.S       |  4 ++--
 arch/loongarch/kernel/unwind_orc.c | 11 -----------
 2 files changed, 2 insertions(+), 13 deletions(-)

-- 
2.42.0

