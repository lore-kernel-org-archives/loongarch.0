Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996090;
	b=vaDRmtHH8ulkMEzLaLyVFpQ/fRpGyaij5SMW68vd00JAfAyCjZ3aTp0ACADVGmymlkc/
	 g0mHdoygYat9KbWUZjKmA0lSpHprJVEPYK9sPnqH1S4MuUa0Cdno9cVxYD/O1/QlhJEJj
	 6KPCVU4k+gWpzdc197KjupZS+/hu+YyZYDzPD1UrzV6kYpzTZdC8AbQonqmson4zGyJGG
	 K20cZsx3fhwhUrU8ydSd/BbNFTtxPpixedaunNpHo3FgE6gPsr3jhnLsk9urhQkqLagbC
	 lW2lz2/jR3sLJIjqDfcj3XWOuJHgZtOz6xKX3agw1WmZv7bbghJdtwr979bGzUTsG4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996090;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=UKWjVZpbhwfl1kXwmyPrP7TMuw/VD84DqotItrop890=;
	b=Mfk07YuYaYtn6x+uASgtddcCKLAoWBmZ8mLXs8LRUkxgKrYi2dwi9B4M8CXq+6vcha8B
	 lEu/1u1uzUvMQXFf81o5I/MqHsDQrpz3NK7RK94bTYP5K2FKzegyF2D/yLmLFE+lNkBu5
	 VqMjY3vVqd6xu9MAKH/o7nfQAeimM6WzXcnINshDVp86WZbZQIzS8xxuyc6Gd+o+cmsDo
	 rcNpcOVF4V+Vyt54YryODZ3Ysnhty+yp+2GlHv0rTh5UeJPEGv+reGgqSzxbl5PPAKNAu
	 fLrWJyEfsu1ax+7SOQlO3RzpoHulO5UINmJRXh7ieRVUm81LHP2S63vij+ROUfE49VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CAD606A883
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9CAD606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8Ax39J1d_1qJccgAA--.28219S3;
	Wed, 18 Nov 2026 18:01:25 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAx3c50d_1q0JQ1AA--.41976S2;
	Wed, 18 Nov 2026 18:01:24 +0800 (CST)
Subject: Re: [PATCH v2] LoongArch: BPF: Fix the offset of stptr.w and stptr.d
 stores
To: George Guo <dongtai.guo@linux.dev>, chenhuacai@kernel.org
Cc: hengqi.chen@gmail.com, guodongtai@kylinos.cn, bpf@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261118071444.10258-1-dongtai.guo@linux.dev>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <25a0f5b9-93aa-7d80-423e-b283efcc4b89@loongson.cn>
Date: Wed, 18 Nov 2026 18:01:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261118071444.10258-1-dongtai.guo@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJAx3c50d_1q0JQ1AA--.41976S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw
	0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
	07jYSoJUUUUU=

On 11/18/26 3:14 PM, George Guo wrote:
> From: George Guo <guodongtai@kylinos.cn>
> 
> When testing bpf selftests "jit_insns" and "jit_insns_blinded", the
> "ldst_offsets" subtest fails for word and doubleword stores:

...

> Cc: stable@vger.kernel.org
> Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> Signed-off-by: George Guo <guodongtai@kylinos.cn>

Acked-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Thanks,
Tiezhu

