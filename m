Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E1415A4
	for <loongarch@lists.linux.dev>; Thu, 16 May 2024 02:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715827936; cv=none; b=QezdhfT7zdsWrAlm6BZFC8/QyROpd9BORXWNnbkCE9X4DQvyvFPlV0DOtGLbLkYUCtrRFu6KcWHYcHCmBnDf7E1qxEKdNgFhCoBIjMAM6Zd7XrM0HX35JgTbYkE6svI7/6fCZbEPB9mFWRkgu173ggsi9kyJauW4h3ohYDBZRCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715827936; c=relaxed/simple;
	bh=Bpp2sS8JAC34w//706OVYxm4uK643Velk4anITvY9sQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=r3AggE/d3lJnWv7si1ilMIOMeoDBGfJnONAZPtlERBuE+HUL0tL0rfmYtwy0rKijLO1GEGmWvXJn1P8TmqlO+z9iDyTeIzgKsm8yTphlF75IKaPYfmrc+gW04C7XSnbturgPlzrXzJZx0bxVZ1+1T7dhMMBIBISTveqCpAAP0ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.173])
	by gateway (Coremail) with SMTP id _____8AxTevadEVm+FsNAA--.25472S3;
	Thu, 16 May 2024 10:52:10 +0800 (CST)
Received: from [10.20.42.173] (unknown [10.20.42.173])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxb1XWdEVmdXkiAA--.2393S3;
	Thu, 16 May 2024 10:52:08 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Define __ARCH_WANT_NEW_STAT in unistd.h
To: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>,
 Xuefeng Li <lixuefeng@loongson.cn>, guoren <guoren@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn,
 stable@vger.kernel.org
References: <20240511100157.2334539-1-chenhuacai@loongson.cn>
 <f92e23be-3f3f-4bc6-8711-3bcf6beb7fa2@app.fastmail.com>
 <3937d6b1-119b-195e-8b9b-314a0bfbeaeb@loongson.cn>
 <ebf493ee-1e8b-426d-bcf4-d8e17d10844a@app.fastmail.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <14d52b91-58b2-6079-b66a-f01d1bac583f@loongson.cn>
Date: Thu, 16 May 2024 10:52:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ebf493ee-1e8b-426d-bcf4-d8e17d10844a@app.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dxb1XWdEVmdXkiAA--.2393S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tF1kGrW5Cw1UtryrWr47KFX_yoW8XF17pF
	WSgF1a9FWqyr1Syw4Ikw1DtFnYkryrJr45Z34FqryxAay5Xr13tr1FqrWUCFyaqFyxCFyj
	va93Wa4fuFZ8ZagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-
	UUUUU



On 2024/5/15 下午10:25, Arnd Bergmann wrote:
> On Wed, May 15, 2024, at 09:30, maobibo wrote:
>> On 2024/5/11 下午8:17, Arnd Bergmann wrote:
>>> On Sat, May 11, 2024, at 12:01, Huacai Chen wrote:
>>>
>>> Importantly, we can't just add fstatat64() on riscv32 because
>>> there is no time64 version for it other than statx(), and I don't
>>> want the architectures to diverge more than necessary.
>> yes, I agree. Normally there is newfstatat() on 64-bit architectures but
>> fstatat64() on 32-bit ones.
>>
>> I do not understand why fstatat64() can be added for riscv32 still.
>> 32bit timestamp seems works well for the present, it is valid until
>> (0x1UL << 32) / 365 / 24 / 3600 + 1970 == 2106 year. Year 2106 should
>> be enough for 32bit system.
> 
> There is a very small number of interfaces for which we ended up
> not using a 64-bit time_t replacement, but those are only for
> relative times, not epoch based offsets. The main problems
> here are:
> 
> - time_t is defined to be a signed value in posix, and we need
>    to handle file timestamps before 1970 in stat(), so changing
>    this one to be unsigned is not an option.
> 
> - A lot of products have already shipped that will have to
>    be supported past 2038 on existing 32-bit hardware. We
>    cannot regress on architectures that have already been
>    fixed to support this.
> 
> - file timestamps can also be set into the future, so applications
>    relying on this are broken before 2038.
I see. And thanks for detailed explanation.

Regards
Bibo Mao
> 
>        Arnd
> 

