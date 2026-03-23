Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55C32C15AA
	for <loongarch@lists.linux.dev>; Mon, 23 Mar 2026 06:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246590; cv=none; b=K7qh7s+19IB+Bwh6HeBqrqx3W4xBCCLZNukV/dDbz4/NSmgzWoEUlgxzqFbWfvePWPq3ms3GrHdHb7BhSeaDqHYLmz//+zr1dwklOcMVTStrMrF+Qz3n4FjbfuNzkqjJ0E8yNBFEqgF/EWkFTJ/BAxZ+E3CBdmecqEuVfYfv6ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246590; c=relaxed/simple;
	bh=odcJ/r+/o/ITLUuE+GI1sf8oIQWWIJ7knVY7pIjmkr8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IpBJdN/VT4jlzUzGtfY7AJ9+PUzLjbVWz8Na7zAxLd1M5cK9wam4LQJqfODyIYGkVYU6ITgUMDR+XXikH6kONGOulvrjHHZ0Guyc7G+JrpGv2S3xf+EIxSRuqwFO+YAXCNCzvCbh+FGwr10RybNpfyEIusGpQWdoY8bU/t8RIPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.180.13.167])
	by gateway (Coremail) with SMTP id _____8DxccC02sBpKq8dAA--.26150S3;
	Mon, 23 Mar 2026 14:16:21 +0800 (CST)
Received: from [0.0.0.0] (unknown [10.180.13.167])
	by front1 (Coremail) with SMTP id qMiowJBxiuCy2sBpmSNbAA--.39116S2;
	Mon, 23 Mar 2026 14:16:19 +0800 (CST)
Message-ID: <7d602b85-1436-40b7-88f3-7f3eadfb43f7@loongson.cn>
Date: Mon, 23 Mar 2026 14:16:18 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LoongArch: Increase MAX_MEMORY_RANGES to 1024
From: Ming Wang <wangming01@loongson.cn>
To: kexec@lists.infradead.org
Cc: horms@kernel.org, loongarch@lists.linux.dev, chenhuacai@kernel.org
References: <20260304011914.880120-1-wangming01@loongson.cn>
Content-Language: en-US
In-Reply-To: <20260304011914.880120-1-wangming01@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxiuCy2sBpmSNbAA--.39116S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAQEPEmm-hMQJnQABse
X-Coremail-Antispam: 1Uk129KBj93XoWrtr1xuw1xXw4xAr17tF4kKrX_yoW8Jr1xpr
	W7AF1DGrWrWrs7tw1kt39xXwn3G343KF1xWFya9ryxCr4DXr1Iv3WDWrZ8XFWUXw4rKryI
	grn0g34FqFWDXwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjx
	CEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAF
	wI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0x
	vEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1GQ6JUU
	UUU==

Just a gentle ping.

在 2026/3/4 09:19, Ming Wang 写道:
> On some LoongArch systems, especially multi-socket machines like 3D6000,
> the current limit of MAX_MEMORY_RANGES (64) is too small to accommodate
> all memory range entries in /proc/iomem.
> 
> When the limit is reached, get_memory_ranges() stops parsing, which causes
> kexec to fail with "locate_hole failed" because it cannot correctly identify
> the crash kernel reserved memory or necessary RAM segments.
> 
> Increase MAX_MEMORY_RANGES to 1024 to support systems with complex
> memory layouts.
> 
> Signed-off-by: Ming Wang <wangming01@loongson.cn>
> ---
>   kexec/arch/loongarch/kexec-loongarch.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kexec/arch/loongarch/kexec-loongarch.h b/kexec/arch/loongarch/kexec-loongarch.h
> index 2e65eb0..895809c 100644
> --- a/kexec/arch/loongarch/kexec-loongarch.h
> +++ b/kexec/arch/loongarch/kexec-loongarch.h
> @@ -8,7 +8,7 @@
>   #define BOOT_BLOCK_VERSION 17
>   #define BOOT_BLOCK_LAST_COMP_VERSION 16
>   
> -#define MAX_MEMORY_RANGES 64
> +#define MAX_MEMORY_RANGES 1024
>   #define MAX_LINE 160
>   
>   #define CORE_TYPE_ELF64 1

