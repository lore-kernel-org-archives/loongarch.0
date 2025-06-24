Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21A126CE03
	for <loongarch@lists.linux.dev>; Tue, 24 Jun 2025 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750779459; cv=none; b=POJ2vjwvxZGCJPX36O4O95iCLfR6D7/U0ytMj9/f/WOEEh+vxU/XFCTLFFamefZ9dUlQkbxIOcBsmsRRhQv0F8T1+YoykhUMxi4kSzb39nppz7dh5LsTL4ecj5DTrNwvcoJ6zPSRXUeLuFfFQrQDNYE246dgPQ5HAbnIaOwu00s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750779459; c=relaxed/simple;
	bh=9yD24w3hwnr4+ufwnRafqKEOMt8umxCooN3X3OiOeKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PZTCt4PWa81AoyQqVL7vfFgMWoGiNObom2yYmfPIYLgGyz+PVl0SV9USw8ktPRCUQRDwpbFa86AamKfHOP7AjLLoQAuENtyvSIwzrDsGN2b6el//Pnk7mBq64+Z4BsLXAxa7knzxsj7yzDs2zl3tKM1mnPkJjsCZPI+FZ5A/XVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EyYoegGp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EyYoegGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750779455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6qf+Wz6GegFb42AbMNpEijqTZTCN3CmEwMReF0RBEFI=;
	b=EyYoegGpFLN7rNffUel77K2W+sXUoxnGJ8mGGonCIon665Ob6iE4UDcz2TULuawrmJ8xTu
	mksXiB2H7O1lvTFYiWa3mKDDNNQu5j3SrFaAtqoXGNaYJXhYQvasliIw7eVK/N8IdR0ANE
	D4iMl18jaKi88uNGMVLwp7bSPdCk/Wc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-iz8Nhu0gMpmHBFJTb5WAKg-1; Tue, 24 Jun 2025 11:37:34 -0400
X-MC-Unique: iz8Nhu0gMpmHBFJTb5WAKg-1
X-Mimecast-MFC-AGG-ID: iz8Nhu0gMpmHBFJTb5WAKg_1750779453
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4535d300d2dso4724715e9.1
        for <loongarch@lists.linux.dev>; Tue, 24 Jun 2025 08:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750779453; x=1751384253;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qf+Wz6GegFb42AbMNpEijqTZTCN3CmEwMReF0RBEFI=;
        b=H98Bn8LWQQDcv7IkQgoCyJfPqYL/AkXAXcRt3Jjxmj7dgLQqnVkwbo0ft0U3i5KLTO
         bwn1HBaOajAgtfXDnLkOF54Wm+85SeNJvM+GmNbJgbxrJeoAqTGdB8QvX2iFFQysMf8B
         BNy60le+wzLhlApj0hZOKqCi+2e4kIgajaQhBF69ztE6aw+DVXFjl5LVXU38KZFFvLBR
         EfLdQSontoeHMKMe4fuod/AVet8+4kMyHwJXrr83t3VLZMVlqFsz50yJOEkasSmC8rYe
         +KeY7JenlUL/O6ilWjGNsuQMa075+lOXtZQw/Qmtipvp1HG7wIyqGqnCCcB8bVn/MG3b
         D9fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtOAyU+qBVaAo2409HsTKSTARRyBEV9C4Yue+DDvamfXbOEyBwqgLCtDbcyYhNYe7mudOJ8GNb5cM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1Yw1TMZFJoc8v3If8Taau3V52k4NqKkOYAXhFe3hxHqNVf5AE
	mS1ZkYIaY1JSIUY5qvEImKLbfG3CLphmix3aanuOfDxm72mi3Xllpdmi7es36I1BzrQum171g6n
	202OxEDO+FXuqo7QD7N0gHG8dA04dSm3vQCthss+wb/ktEOte3LoCLkI1HyMpMSdVcdBy3Q==
X-Gm-Gg: ASbGncuy4rs4Jdn7F+Prv0ztIJ7w4ezAqTsmE013bGZHTsP1G1vvcvyCEwhJnh6d3oX
	P5/LqPJfenS8zI7nSyHl4o4zYlZIIXOZj1QY8MibpG9WE1kd2p4i36rp+jeeDTntdusJcgjnYin
	Qz56j6weLiZtGkbd+hoopMQJSvWhRQM1nrp75c59Opam2Xj0rBu01TJIWpNfZG97Ur4st162Sq8
	jkaZRBkXUmROuV6u0nqkDBjHGi7nzq1Kp+XMy0JTzWoHzD/j6bxwZX5qumYUrmKeoEnU5tMvxNT
	rol4+0cPbLSfKr9vqBGtY76guFT8LgEOxyNv6Mori99h+AFTs6qwui7wCHWERZk=
X-Received: by 2002:a05:600c:3115:b0:453:9b7:c214 with SMTP id 5b1f17b1804b1-453659b896emr164207935e9.29.1750779452856;
        Tue, 24 Jun 2025 08:37:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE8kaMj/i8P01HMgdjsZxARqDAPHomeLDZBAzAwgVSzJz7l4mLdy167urUQ74Xru6bUCCwgQ==
X-Received: by 2002:a05:600c:3115:b0:453:9b7:c214 with SMTP id 5b1f17b1804b1-453659b896emr164207595e9.29.1750779452388;
        Tue, 24 Jun 2025 08:37:32 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-115-198.pools.arcor-ip.net. [47.64.115.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536470415csm144611765e9.31.2025.06.24.08.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 08:37:31 -0700 (PDT)
Message-ID: <66ba81a9-3fd0-4c6a-ab9d-1a02f8c89dd3@redhat.com>
Date: Tue, 24 Jun 2025 17:37:30 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] loongarch: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 the loongarch headers
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Andres Salomon <dilinger@queued.net>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
References: <20250611120328.120219-1-thuth@redhat.com>
 <CAAhV-H4kA_dE8k_6e3h7jSE-TD_fLsF3exB8UpBwM6bLXuThUw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAAhV-H4kA_dE8k_6e3h7jSE-TD_fLsF3exB8UpBwM6bLXuThUw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7h0Iv_fxtDmd8O9PKau8Y0uKJTDpvlpj9CaT7elc_mg_1750779453
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/06/2025 16.39, Huacai Chen wrote:
> Hi, Thomas,
> 
> On Wed, Jun 11, 2025 at 8:03 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> From: Thomas Huth <thuth@redhat.com>
>>
>> While the GCC and Clang compilers already define __ASSEMBLER__
>> automatically when compiling assembler code, __ASSEMBLY__ is a
>> macro that only gets defined by the Makefiles in the kernel.
>> This is bad since macros starting with two underscores are names
>> that are reserved by the C language. It can also be very confusing
>> for the developers when switching between userspace and kernelspace
>> coding, or when dealing with uapi headers that rather should use
>> __ASSEMBLER__  instead. So let's now standardize on the __ASSEMBLER__
>> macro that is provided by the compilers.
> Though it seems the trend is to use __ASSEMBLER__, I found there are
> some old commits do the opposite:
> 
> 36396f3c36b04f79438f87a0fccfa76aa3de6af9 ("[MIPS]
> s/__ASSEMBLER__/__ASSEMBLY__/ for clarity sake.")
> 
> fc4ac7a5f5996712d9123ae4850948c640edb315 ("x86: use __ASSEMBLY__
> rather than __ASSEMBLER__")
> 
> Huacai

  Hi,

unfortunately, the commit messages of those two patches are not very helpful 
- one is just saying "for clarity sake" and the other one "As Ingo pointed 
out in a separate patch, we should be using __ASSEMBLY__" (but I failed to 
find that other patch where it might have been discussed). So it sounds to 
me like they tried to standardize on __ASSEMBLY__ just for consistency. 
However, that mission failed since other occurrences of __ASSEMBLER__ have 
been added to the kernel in the course of time. And __ASSEMBLER__ is also 
the better macro, indeed, since:

1) Userspace programs usually don't have __ASSEMBLY__ by default (unless it 
is set in the Makefile), so the uapi headers should really use __ASSEMBLER__ 
instead. And if we use __ASSEMBLER__ in the uapi headers, why should we 
still use another macro for the remaining kernel files?

2) As mentioned in the patch description already, macros starting with two 
underscores are names that are reserved by the C language, so it's better to 
avoid __ASSEMBLY__ (yeah, I know, the kernel mostly does not care, but still...)

3) Since a lot of other (userspace) projects use __ASSEMBLER__ instead of 
defining their own __ASSEMBLY__ macro, it's a constant source of confusion, 
see e.g.:
  https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
  https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
  https://github.com/riscv-software-src/opensbi/issues/199
  https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/

So I think we really should standardize on __ASSEMBLER__ nowadays.

The related cleanup patches for x86, parisc, sh and arc patches already got 
merged via their specific architecture tree:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24a295e4ef1ca8
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a141be3233af7
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cccaea1d66e94b
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e2b6a188625a2b
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9cc646950eefda
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=179e949719fe81
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2cb74be378675c

So it would be great if you could take this loongarch patch also through the 
loongarch tree!

  Thanks,
   Thomas

