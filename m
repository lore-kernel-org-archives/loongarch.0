Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6981B1E515
	for <loongarch@lists.linux.dev>; Thu, 10 Apr 2025 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293717; cv=none; b=eCuTU2UmRYs++V+cbMk49bdQJsdcXlVI15DG3UC2uKddvI1odKvRaurapnFORTa8omMWXZEPu2MISG4BJQsY/9HebQqj3MT9P+s+Jg0sqy7ZtMSfKxXQvTylfeUqeA72i2b41XmK5ZsLbTD05XRSK8p1hVj07ylAeAOCZ7SiLSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293717; c=relaxed/simple;
	bh=sw3vK6z8fQjBuRgQszQR109R2Cqf5C0TdwJ61a/B8JQ=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qCpqFmtGHuv+lwk9+T42BYBlVHZdJnN5ZsRPqnjopb4zT0rCgVhgSqpd6YY0a7l5VnJdnEIbcH0hYbqhIMv9JA6Y+RXR16t/y4TVhrZhSbWd7Xdue6ukI3fT7Kzmt3LF9w5QdXApcWGjoMIvRpaYTQYVTEgoMftdkM0daC/F2/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAqy8hm9; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAqy8hm9"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so785809b3a.1
        for <loongarch@lists.linux.dev>; Thu, 10 Apr 2025 07:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744293715; x=1744898515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWAOaB8U3KFCIOrhTxD2O2vP23GerEEFQhxVmQdK6Js=;
        b=SAqy8hm9NSGypq9AUIxsBSRoTG4GuvPJUWu2Kh+iUfJwTkz6URVqY08hjvYTSuQe5L
         GAN2RpHBJ/9EZNIhkXwWgKTk/9QWiAMllNeNOI9eTrnBB8bjhmAXONjyhDFl1rJBH5t5
         ENlt+uSx+IdwP+y9fY8jme65/ncro7n+FbyVpvfLiiB8G0TgSPKaQ0ugpPOrl0ERWSqy
         K5b9sCQ5v0+djOjmQCf+DtaEqLdgmt2cBC/0KbzI8rS2apfjMgSbyxE2Nd5FgRCn7KMk
         C2FvkASQrTpAuWBB9nlpTwupqCkBt1z/QUhQAQx9UDN1OTXWeubjwIkWTDcNv798GyHB
         I4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744293715; x=1744898515;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cWAOaB8U3KFCIOrhTxD2O2vP23GerEEFQhxVmQdK6Js=;
        b=lelKHHQ1kkvXpiwty3mSGYZY6JtFRnQum6yjeihuRMg0L1W1nT7NXMvAdcgWewTYZz
         43Go3/wQgOCEoZVn6KPxQVv8sfscgeV4j37MLv/FW4m7dW/Xhnd9p3pobo06bGj9GqUW
         TKisk8qIazLebQrP12dxJiUfHYRxNpndEqbCoCVosga7Yunw5Kw8zt16WHZ1X+FBMXjj
         56va1p0FbiTfmKMyWFBqKGg+u7G0hA/XaRVmgr2R34dpvMxsVfJwQbqkGMNiSyJyb46M
         xx5EMUCryFGQ+fTp0BeM1ndy2XTYvLVcnn7VtGPT/Gt2i5qXq/o8LhBvsTzQ3SEHP4SY
         wNmA==
X-Forwarded-Encrypted: i=1; AJvYcCWgpd12pP5imRaapDo1DUl4YrBDWiITwT+UvvHLLwQ9Gb4szlSU9wbsZqMagh7S4020grOrAIuNSkA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9CQPjN3mf9yHrunbGLgQ/fTJ3jKuriRnViBtGKKMadpGdaiiN
	HdzHo8O7xq74b0xInaQ/lkYoJm3nwAQbppeYoy6dqWwKDaS4Jr6p
X-Gm-Gg: ASbGncvpdccUPl5LBEByhxq+CphPyMCexQ73+0Dsx5IVTHvhp7JqXWgYVap7FA+jGRL
	lRBlP+Pvy/vzjGYgvtp1BeR1NztZHJe8BmANw3oGFcdcNz7jK0W8fqet+YkUzb0MSHRQHTHmKbL
	pHVsoXjNq6gJ+4dK76TDTqT07yzaXWLJTQHV2tJBu2gG2HoYhiFpucwiRQkfAtQt18wpKamzgPC
	LniDG+VtDXYqQF3GltY8m2yvE1uA6w1YFmgoMF3zKNlc+bRVnZAav4+zC6R1T9Ng79rYOffoG1Z
	ldoWgasONHTifoP8xHRYruBRZmUsEqH94nuHXs6WHjMyTgNQST7ijn1i7rzyp3HDjl3sDs08n7E
	GksfvL/DDPx6O+n+c3HEvpzg=
X-Google-Smtp-Source: AGHT+IHBTE6t3tMPyBmMiDGR0D6P+It1/bo69iX0No3GsbY7YKBIFvGuQ1V6G4gotfqVUWbx+i87Xg==
X-Received: by 2002:a05:6a00:8c9:b0:736:a973:748 with SMTP id d2e1a72fcca58-73bbf01e262mr3359584b3a.22.1744293714003;
        Thu, 10 Apr 2025 07:01:54 -0700 (PDT)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e3824asm3362820b3a.103.2025.04.10.07.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:01:53 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:01:38 +0900 (JST)
Message-Id: <20250410.230138.20974725432146108.fujita.tomonori@gmail.com>
To: gregkh@linuxfoundation.org
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, peterz@infradead.org,
 hpa@zytor.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, tangyouling@loongson.cn,
 hejinyang@loongson.cn, yangtiezhu@loongson.cn, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu
Subject: Re: [PATCH v5 4/4] rust: Add warn_on macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <2025040954-prenatal-enamel-373f@gregkh>
References: <20250409065802.136971-1-fujita.tomonori@gmail.com>
	<20250409065802.136971-5-fujita.tomonori@gmail.com>
	<2025040954-prenatal-enamel-373f@gregkh>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 9 Apr 2025 09:38:53 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Wed, Apr 09, 2025 at 03:58:01PM +0900, FUJITA Tomonori wrote:
>> Add warn_on macro, uses the BUG/WARN feature (lib/bug.c) via assembly
>> for x86_64/arm64/riscv.
>> 
>> The current Rust code simply wraps BUG() macro but doesn't provide the
>> proper debug information. The BUG/WARN feature can only be used from
>> assembly.
>> 
>> This uses the assembly code exported by the C side via ARCH_WARN_ASM
>> macro. To avoid duplicating the assembly code, this approach follows
>> the same strategy as the static branch code: it generates the assembly
>> code for Rust using the C preprocessor at compile time.
>> 
>> Similarly, ARCH_WARN_REACHABLE is also used at compile time to
>> generate the assembly code; objtool's reachable anotation code. It's
>> used for only architectures that use objtool.
>> 
>> For now, Loongarch and arm32 just use a wrapper for WARN macro.
>> 
>> UML doesn't use the assembly BUG/WARN feature; just wrapping generic
>> BUG/WARN functions implemented in C works.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> I don't object to this change, but I would STRONGLY recommend never
> using this in any driver if at all possible.  Only use this if the
> system is in such a state that the only way out is to reboot the kernel,
> which is what both WARN() and BUG() will do.

Totally agree.

As stated in the commit log, BUG() is already used in multiple
locations within the Rust abstractions.

I'm not trying to introduce BUG() or WARN() as new features. This
patchset aims to improve the information provided by BUG() and WARN().
