Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F08023A9B1
	for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 01:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758159898; cv=none; b=F/8EXnZArfRHfMqCMZm2jyGM0ADj6dbHCUDY4Xn4knt1oGCs0hFnag7BcjOYObj6l0Dl/+hZgJZAGg2IYAqgSGHStUQiAwiU4RfRfnWQ6z/2Kk4rLOH739dYfvL6UIICNYgfDA46F3H3NfOH2NW+XTIJmRN5wNdNG7hJejdGYDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758159898; c=relaxed/simple;
	bh=yObyqBIvnOk7MzWv7rFUNE1ZAMjFKISL+S39eQDndyg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=JcC+KkqGxctxOuo2r7jFk9xW7DL1zIOLA199usUzQ1nhAQf8WooriE5LCWD34W/0rxpAhqzmTEZyp9dJIHJB5LhHb8dIZyTjY6mavrCvpKg87lS9WO0zrnsHCAO77T7F1XsB7LH+7Azho4rNZsZqidzGOlLHkhScrRLYvJyrnfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.164])
	by gateway (Coremail) with SMTP id _____8BxndIWZMto5Z0LAA--.24720S3;
	Thu, 18 Sep 2025 09:44:54 +0800 (CST)
Received: from [10.20.42.164] (unknown [10.20.42.164])
	by front1 (Coremail) with SMTP id qMiowJDxK8ETZMtoO6acAA--.7691S2;
	Thu, 18 Sep 2025 09:44:53 +0800 (CST)
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in LOONGSON SECURITY
 ENGINE DRIVERS
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Lee Jones <lee@kernel.org>,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20250912074638.109070-1-lukas.bulwahn@redhat.com>
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
Message-ID: <f9b0ba8f-b2cc-3a24-3afe-247763d8ad71@loongson.cn>
Date: Thu, 18 Sep 2025 09:43:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250912074638.109070-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJDxK8ETZMtoO6acAA--.7691S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFy3KF1xuFyfGFWrtFW8GrX_yoW8Jw4rpF
	srC3sIkF47Jr4UCwn8AFyYka4rX34furya9Fsrtw1DX3sIy3ZYqrWjkF1Dta1DAr1fGr42
	vFZ3Cr45WF48uFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUrNtxDUUU
	U


ÔÚ 2025/9/12 ÏÂÎç3:46, Lukas Bulwahn Ð´µÀ:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit 5c83b07df9c5 ("tpm: Add a driver for Loongson TPM device") adds a
> driver at drivers/char/tpm/tpm_loongson.c, and commit 74fddd5fbab8
> ("MAINTAINERS: Add entry for Loongson Security Engine drivers") adds a new
> section LOONGSON SECURITY ENGINE DRIVERS intending to refer to that driver.
> It however adds the entry drivers/char/tpm_loongson.c; note that it misses
> the tpm subdirectory.
>
> Adjust the entry to refer to the intended file.
>
> Fixes: 74fddd5fbab8 ("MAINTAINERS: Add entry for Loongson Security Engine drivers")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa7f80bd7b2f..a1339a8bb705 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14537,7 +14537,7 @@ LOONGSON SECURITY ENGINE DRIVERS
>   M:	Qunqin Zhao <zhaoqunqin@loongson.cn>
>   L:	linux-crypto@vger.kernel.org
>   S:	Maintained
> -F:	drivers/char/tpm_loongson.c

My bad, Thanks

Best regards,

Qunqin.

> +F:	drivers/char/tpm/tpm_loongson.c
>   F:	drivers/crypto/loongson/
>   F:	drivers/mfd/loongson-se.c
>   F:	include/linux/mfd/loongson-se.h

