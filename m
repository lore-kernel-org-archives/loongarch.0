Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C052E541C
	for <loongarch@lists.linux.dev>; Wed, 23 Jul 2025 13:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753277044; cv=none; b=R9z8uixm9sB7ZqJnPuChcehsCMgr8UmBR0G+3pyFOOVnzE6m5HlqJw7OPQWDWKON294GaPjl/8RG97SRMOLbyPn78Puwi+Fg2Rawi+WcHrethqalP3ZZp09eSlp1Yvcu7+5zwv6MUsx1HWRTyzBInaCJi85txkThE/8gIZmi3g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753277044; c=relaxed/simple;
	bh=g325tVK4oCmVy8BazrF60y4Ub/2vaJobxM9gJAh3M5I=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dn7a4i0QDDQekV1DALnxfAFG6+w3WCiQztTqDxmIV4tfV8jRBiow9K6H2oFKdmuYTBA2i3XP0BLrXv6GUcuWTlN91HkkftQkmBzihwDIK0Gnz3wFDxo/p6xG5LQ2vKz0gD8Hitw9mHwkZdfxv7DBSXy/p15tRQJM7d/7BWz2HS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fbhwh1Ez; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fbhwh1Ez"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23636167afeso63977325ad.3
        for <loongarch@lists.linux.dev>; Wed, 23 Jul 2025 06:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753277042; x=1753881842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxSF6lnsSAWsI4yFBGjBR+eKMGMyYNRUTfnKAxfWQFc=;
        b=Fbhwh1Ez6Zzenpu6Nc7R1KaYb28ZdPh150SKkNokL3Dtk8rtj7VsOpL62O+YYrKQf1
         C+ZALW6f4kUX7m7bADuTdLKVKHf5i/UYtoUpTgZFyXed0Ek2Y2Y0483DgyE71LIkRhav
         vpgoBR5dd8iCNYB3pDmwO6vnzcRgl8aNZF3hUmAyt+UuGGIh/RPrhnN3SbtdAqPOmPzW
         qVoJnN4+X0wqkGF/tarlwHQwEY505yxRpbT0tz7lvS25VmhWvWrmWrj7yZ7Zr+7LMauB
         xe9JnFtgdkE96Sg1+QJqRK/PehZyTuiXl3qAJIBhr6zq3yxfKpnTW8cfL/QAtZNlCpHO
         tHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277042; x=1753881842;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AxSF6lnsSAWsI4yFBGjBR+eKMGMyYNRUTfnKAxfWQFc=;
        b=C5i914Re7dtuJ9BKwyizToNDpdlRjYlZ4f0q+97wGoOHPOObwFu+BEaxgH0a8AXLbl
         c4h2GJeGpk9ArOxSqP5fHT5M6YPbQp8Z8O2Wg1IB+795UQBQ3zk0amzt4839wgq/fvvJ
         5qSos6Qs9cjjrSKo/7ywUMQ0xPhOra6hPoTJ/7G88XMrIugn4H4VbfBKwy8Lhwdtaz2q
         klF9aaU7+Y7Fh1wvxhWbrMlFRc1q3Bpwd4YaYU8uCW7pFdeNC+Y5qHBruUOBprvHUlXA
         FeYy8sXkBqdQSaGvR84DT94MOHrhgyxZAUJhNKTVqsndE1087nZ35PCLyodh/nAuq3O0
         OO8g==
X-Forwarded-Encrypted: i=1; AJvYcCWQxeNuJgWaVttVZQ+k6lcLx2l4m3iUojhG8v0C7R8skaOMEPvCTDbg6At2D55Um+1FJuCUY/QIKHU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv9NWeZnZ38ci1wKGsW8cdCsEBs5eDQyD+WM4MKnlcgKlw9hJ5
	IWu3rS9azlmXS7Hn4ebyEtLyCm1xnx+0vfCkZktPTLoPSSwBIXCyd1Ti
X-Gm-Gg: ASbGncs5H53I0+msCEDOgF8QBwQP6SW0JP7D4fynIqkVnX1aa0s64fXpXFqu45+hE2R
	y+MmszIJZPuuzv/UAu26KUvSLWEONUmluMLmX2R50SczjQoRofk5jxn8Rb6BzveJi4uf78cUQ64
	2/n8fm+cVp+t4Nqc8SOhPTovlFsQFUI86VXaj1n+cx4cBUWFB8rWm9nHbAojzmdKjvfhsqiczG0
	lgxIi5TivWRYY/1Rw0ey1qB3EgSGrxTbbr2N/uPIxPJfU5Yn3R8U5yXAg671M3tvmxV3ofnahjR
	lPSlPH46Av03/8ikkMCjbhFHk80Jc4wwT0vgYvM0nPKe7ll3Hr1iAQo4GViIZy/6Oy+jSgWyBQ0
	fgmavMIWsTEK8XpTfnqi4WQ5srWrNXrXqNJCH1dcoaxXjvj0eoJFYhIV1cv1RTh/4WK6QTlN/lS
	Lo
X-Google-Smtp-Source: AGHT+IHeJqmBBFuJxJuYzYQrFS3o4VgCeV81DU3JpPQ+6NIF4D1yK+R8kibmHclHfqnrmsxDYjwysQ==
X-Received: by 2002:a17:902:e887:b0:234:bca7:2920 with SMTP id d9443c01a7336-23f981b42c1mr48016245ad.24.1753277042029;
        Wed, 23 Jul 2025 06:24:02 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e4750sm97384825ad.6.2025.07.23.06.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 06:24:01 -0700 (PDT)
Date: Wed, 23 Jul 2025 22:23:43 +0900 (JST)
Message-Id: <20250723.222343.803840555288624865.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
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
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH v6 0/4] rust: Add bug/warn abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72nLQkJo8voGONJBEgE8st7=A4RW7VP+W++SVCWse49n=Q@mail.gmail.com>
References: <CANiq72=Hr5rg7tYta8aUoxt8hOPjR2ik5_-xMWZwacr63=-7KA@mail.gmail.com>
	<20250723.152042.1300024463910400.fujita.tomonori@gmail.com>
	<CANiq72nLQkJo8voGONJBEgE8st7=A4RW7VP+W++SVCWse49n=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 23 Jul 2025 11:52:04 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

>> The patch for arm64? I tried to minimize changes to the original code
>> so not intentional.
> 
> The riscv one, i.e. from the range diff:
> 
>     @@ arch/riscv/include/asm/bug.h: typedef u32 bug_insn_t;
>                 "2:\n\t"                                        \
>      -                  __BUG_ENTRY "\n\t"                      \
>      -                  ".org 2b + %3\n\t"                      \
>     --                  ".popsection"                           \
>      +          __BUG_ENTRY(file, line, flags) "\n\t"           \
>      +                  ".org 2b + " size "\n\t"                \
>     -+                  ".popsection\n"                         \
>     +                   ".popsection"                           \
>      +
>      +#define __BUG_FLAGS(flags)                                        \
>      +do {                                                              \
> 
> If you look into the `.popsection` line, your patch adds a newline,
> but I guess it was not intentional. In x86 there is a newline after
> the directive, but there we have `extra` afterwards.

Oops, indeed it's not intentional.

> (I noticed since I went to expand the macros in a dummy file, given it
> can be something tricky to spot differences in the normal diff, but it
> is visible in the normal diff.)
> 
>> Yeah, I followed the original code style.
> 
> And here I meant (i.e. the first part of that paragraph) that:
> 
>     -                    "\t.org 2b+%c1\n"                                  \
> 
> now generated those two spaces around it:
> 
>     +       "\t.org 2b + " size "\n"                                        \
> 

Ah, not intentional again.
