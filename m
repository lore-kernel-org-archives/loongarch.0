Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196991;
	b=eGAanAbOy/h94NGPJ7PAvnbHX2xbW+rP+qY8gEC5dNFNQ3+Le4Iff3PvcNTqaEHouIqX
	 KY7RvveCxNJauhquL/Tdo6nrdDP310CyKB5959VVRJT/aqJM17Nbk/AEVBSoL38DLeS6e
	 mtGXJHwrfeKJHAEoSSlEAab0BhJzWqNG2gcDLfI67XkfA2uVpn2xxUTyp3WSORYcAWHnE
	 ywL6kXVd+4yPr+IwXdzgZnuiRzN7XibKCHKMP2e633ZLhRdWOy1MkR3L4RoeTsHh7vLwt
	 NRjZBphmc0J8vcEq2xaqapH0msQw5KzmWW2F1lLcgjmOfgI+7gQT5JbilJhEaSpe02w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196991;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=fnRDAiB2cntvnPiS4wkJ2xzZ+FM8Mkey0/WXYnf6VG8=;
	b=x2DXuH3dmTWFW1AaF6ct7DktYBD+GY6Jwk9nqIm14INSeDHUMqwB2+yyIu0ZrsOy7eRj
	 +kJ19iBLXpwHy6kP4QaDdG0uPsM24hEUkEKQ+NS5WGNI18XZFtbMfWRGs0H8yF5BMN1Ve
	 gM23dTUoIm2yFZ2yrQno+0nRs/tZcTIcLVm3ObeOFjGHaqBwMqMnTAusqcUrAJVYujHHb
	 /APLkEJwfFVNctZ6ui0BBe0wX6LZtXpOj1ySla/A26sVbD3tfXLQHWG7HF48AdqtpNM1Q
	 VWh25kasITw7WFpkUhjRAgtu4W9p1oFAy4oCjVZRuUSPnL0eigGhCfY4aXhR9pNoNaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DED9606A323
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 04:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DED9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8Cxf9P8RfFq_LIdAA--.20141S3;
	Mon, 09 Nov 2026 12:03:08 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAxlMz7RfFq9hszAA--.11822S2;
	Mon, 09 Nov 2026 12:03:07 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] LoongArch: BPF: Fix arena and refine trampoline
Date: Mon,  9 Nov 2026 12:03:04 +0800
Message-ID: <20261109040306.11536-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxlMz7RfFq9hszAA--.11822S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU84xRDUUUUU==

v2: Modify the patch subjects, update the commit messages
    and code comments, no code changes.

Tiezhu Yang (2):
  LoongArch: BPF: Make arena support depend on 128-bit atomic cmpxchg
  LoongArch: BPF: Make use of beqz and bnez for trampoline branches

 arch/loongarch/include/asm/inst.h | 21 +++++++++++++++++++++
 arch/loongarch/kernel/inst.c      | 28 ++++++++++++++++++++++++++++
 arch/loongarch/net/bpf_jit.c      | 16 +++++++++++++---
 3 files changed, 62 insertions(+), 3 deletions(-)

-- 
2.42.0

