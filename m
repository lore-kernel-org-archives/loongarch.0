Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFF7285068;
	Fri,  9 Jan 2026 20:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767991068; cv=none; b=cKdDlLZJdgJlxhG9kCHKrnbEOC8BVznL21EcxxBzrWCRBNX3+R5cHdL6Wu3bchsdECWMWTNiQ8Lf/ZYQAHhdKhCDAYyPfA8uvaV4T7mX5KhYTBV4AmpC2V77Ca6hcZGZWqTU7uHXzP3ZJ5Zm8sta/D6X4n9UIXFOg77DyNTZkEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767991068; c=relaxed/simple;
	bh=IpwRDHSDdQ1xcIh2OsPxGzDoZwsCDaob4WeomkJmtuI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jn56Q7usdFgUnclRKoiJPrfP4Z1KB3t0IyDSXuq7yzYrN11BqY6MorpzivJnQ+Rd4ukPiEQRzOUo6O5OSb3kftMcFnm/TTjIjIrSJiL31/MoWKU7ySJSu7X5YFj1tZq5gdabAtOl+lgwvQSl+7Vev5XmzlnQ9DTl7yng7EeRMeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUdRDZF7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUdRDZF7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E600C4CEF1;
	Fri,  9 Jan 2026 20:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767991067;
	bh=IpwRDHSDdQ1xcIh2OsPxGzDoZwsCDaob4WeomkJmtuI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aUdRDZF7AWvwS1qXfDpiOO09oNSGDUMc7PPTbDp17bdwb1/YHqdBaH8dxpPyLtcsH
	 pnsafP7aY5kjZV4e1gyZDymHwCHVuAtds3jTBEa2NzCrAPQpwSDX6XfhQLcR8RxV5B
	 U7trz2chDdH2SzQ4SDYZyO0ho2Ici84xd2nenhWvUaWWFqZQ3dpAy7Ygk5CEg20+ue
	 Pre5EjilzUYfrSv1htYozDNVpMsuVqiSxBbqX2006XAd7CngnKZw+9s/gdoj2sKAzc
	 RV2y/k6tdq8IMO4O03erjUzZtxgCZuQ7ltP6rWN5qYlABsNIFDnB2NWEDVf4NN4GGQ
	 Eeh8+QIoqRqBA==
From: Thomas Gleixner <tglx@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Xuefeng Li
 <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@gmail.com>
Subject: Re: [PATCH 1/7] irqchip/loongarch-avec: Adjust irqchip driver for
 32BIT/64BIT
In-Reply-To: <57748542-d86e-4528-bea3-8f8d8f1abbed@app.fastmail.com>
References: <20251223080437.3367240-1-chenhuacai@loongson.cn>
 <20251223080437.3367240-2-chenhuacai@loongson.cn> <87bjj3rnra.ffs@tglx>
 <57748542-d86e-4528-bea3-8f8d8f1abbed@app.fastmail.com>
Date: Fri, 09 Jan 2026 21:37:44 +0100
Message-ID: <87h5suiktj.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jan 09 2026 at 12:23, Jiaxun Yang wrote:
> On Fri, 9 Jan 2026, at 12:09 PM, Thomas Gleixner wrote:
>>>  static inline void avecintc_enable(void)
>>>  {
>>> +#ifdef CONFIG_MACH_LOONGSON64
>>>  	u64 value;
>>>  
>>>  	value = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
>>>  	value |= IOCSR_MISC_FUNC_AVEC_EN;
>>>  	iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
>>> +#endif
>>
>> Can't this be:
>>
>>       if (IS_ENABLED(CONFIG_MACH_LOONGSON64))
>>
>> which is preferred over ifdeffery?
>
> Sadly, iocsr_read64 symbol is only available on 64 bit systems,
> so it must be guarded somehow.

It's unconditionally defined so using IS_ENABLED() is fine because the
compiler optimizes everything out before the resolv stage.

Thanks,

        tglx
