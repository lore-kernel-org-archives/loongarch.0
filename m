Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D712318C91F
	for <loongarch@lists.linux.dev>; Wed, 23 Jul 2025 06:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753251663; cv=none; b=X8ERwpb26ZniM7/f1QZtnf53xcQx69u7FrVjlUGoDZk5PqOG1+qmuo/9olvmCN+qLPV7Bu3+gCZSTK315qmzn6n/AdWVu6QBM6l63HesvObZlXNPFBX86tVQfYPBqWVO3HATx62eQd6CV6tCFB/d1PrR7Vxc7cw8Z2dCKvEHjUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753251663; c=relaxed/simple;
	bh=dOYO8tpnU06dNy4P4TYEwSAL4PiOkzLs2WaCif6tl8Q=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WGJdLFVsmg0odbJWPFcLsQeQ9k1bE0C02hi5SXzAFqKwP8BU23QJI1sPSEq1Dn2rAla/0wJHl4fyvKklYmEHVoeN6yIGo09ast3vwClcBrGtpTYoPWZU4RKnCPAipXlGpJN4RNvChi4kbweZWX2PNwUibKqha8XkPdpNsHNSPPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iq7rrzYQ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iq7rrzYQ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-74af4af04fdso433062b3a.1
        for <loongarch@lists.linux.dev>; Tue, 22 Jul 2025 23:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753251661; x=1753856461; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTJIJErGkkgE26dleTTxRjWov2b7YHYQZlVlu/+KP64=;
        b=Iq7rrzYQrjq4OztJNot8TQuzeG9m7e9Oi+iOGid9hmVrpqU21B7Y1IDKZThzVNvpSS
         o53toby1fbNJl89hPohrFHEeFtl42GgFEnWjEDtGvbqmrQ2FTKaEJp1m6/abBZW1PL+V
         IPJ48zpepkY20d8xHO6fugs+sEDeXyl6jlk+7uSfpfKhfYryBv4dMO7OUd17gPLEDGIQ
         fBueaLErOHw2TxJ0eJB1mb1VoR2TrOQBE3obx8xde/m9mmxmiozo6N7aR3b7K8BpcWxD
         Fp1KRnsc5HRP4Iu9cVScFc1ll3DA5QhD0e3BZysSXse1k+PwdXCKqzqpGeYOgDJ3oLTJ
         Q2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753251661; x=1753856461;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uTJIJErGkkgE26dleTTxRjWov2b7YHYQZlVlu/+KP64=;
        b=cC4ObOkawf95WGwLGY0xq4sZ/cSw7mNKU9E3TuHWflpaqWJDPyIJmQW5WeLGWeYqMw
         uQ+T2MMkmZOdH7blcT3PLELoZLxwy3/S7jckqYSGH8CB0kJmG78HIZLSPZ6xyiUb/TMb
         TO+h2nTPt81PdQZRP3xMODFbn4oviH3qTfOxeYEWtee2ui0XoFY3Be2vJhMGxobxeygo
         KX45q5RocO1u6fzt69pImYWTnvOqKdzkouWgOYiroWXHOJDAll3yD9hxrzcmvEVzxM+h
         T0hjXJWx6Iw03hiWLl0eP1PmNFi2CVHzclV3pnBOC0MHXYPPqoJgsXOmUtFOtpOdW1UX
         QRLg==
X-Forwarded-Encrypted: i=1; AJvYcCWHuW0wt+7OpxZZoX9aR577+SkA3C7umLA7pF9OQNWiKO3SQqYIgEyIB7e/dH5A6SGUIL4BuqlMj6k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIMGZYK1SzgFvTyT5yhJeL3JVJ4A0GvW0PKDgcuY9wfF/O39dR
	C6jQNUfcCkUC7X8p3cMn3rvoXVS9wWlkLgaMiFkvpnkrJ8CNxyr2kPi+
X-Gm-Gg: ASbGncvmq/OfpygsCI54FmnZbfXf539t2msFsw5FZk0KggU5ZWUdntQUxHiaQV3FXxC
	TdpweIZHwgz+6qNHqUDxrPUKQ288+jOyxaKeMPLR1eqeRJNGOfmTWzscihlICd3biF7Ahju8YKL
	YFqTgrvX4qdpK8P/rIYBHQponWeFG7+w7d2RqJ3T8p3mPTqyzvq9R0eOZmHmv+PR1tWjCdUwAvw
	raTrPXAWnawS+cJ49epFLQISXZj/aX+GVkuyIIDv8MYGHR8YR8tafMZCm3YArzadymqrJQ/Y9Wr
	kDc/349DyHAxeeI9NgecSsv8VHrD4gqEUacptYrJ9zE0cMxdlF6+4hovv3HHdueSUWj3M6E3jf5
	N87ttg4N5q+DeD5lFiMAyGgiL7oE6gt2RqYbgAcDJmFJD+PywQ4C4lG0QN+R9JH3EXqQ1K1ZRbR
	IvAn5o6W5K59E=
X-Google-Smtp-Source: AGHT+IGCxo7rpM1rfk9awKmH6T4kvUglH+Vv6jkf+KqhCJfICKASDS6UxOL8YDc9W4DbQD/ruOaxfA==
X-Received: by 2002:a05:6a21:1fc3:b0:225:ba92:447d with SMTP id adf61e73a8af0-23d48dbeaf4mr3003123637.9.1753251660919;
        Tue, 22 Jul 2025 23:21:00 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb67901csm8977248b3a.100.2025.07.22.23.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 23:21:00 -0700 (PDT)
Date: Wed, 23 Jul 2025 15:20:42 +0900 (JST)
Message-Id: <20250723.152042.1300024463910400.fujita.tomonori@gmail.com>
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
In-Reply-To: <CANiq72=Hr5rg7tYta8aUoxt8hOPjR2ik5_-xMWZwacr63=-7KA@mail.gmail.com>
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
	<CANiq72=Hr5rg7tYta8aUoxt8hOPjR2ik5_-xMWZwacr63=-7KA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 23 Jul 2025 02:48:20 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

>> This patchset adds warn_on macro with the bug/warn abstraction that
>> utilizes the kernel's BUG/WARN feature via assembly.
> 
> Ok, let's move forward with this.
> 
> I took a look at the first three patches and compared the expanded
> output for the existing macros, to make sure we (hopefully) don't
> break anything else.

Thanks a lot!

> It seems OK, I only noticed a removed newline. Was that intentional?

The patch for arm64? I tried to minimize changes to the original code
so not intentional.

> There was also a bad parameter name, but that was not hurting anything
> since it was unused.
> 
> (For the x86 one could be closer removing a couple spaces, but it
> should not matter and other x86 files format it that way, so I didn't
> change it. I also noticed unexpected spaces used for aligning the
> macro, but it turned out it was in the original already, so I left it
> also unchanged.)

Yeah, I followed the original code style.

> Then I found a few more bits on the last patch.
> 
> Tomo, could you please double-check you are OK with all the changes,
> and please run the tests you did back then on `rust-next` again for
> all arches, given it has been a while since you posted it (plus I did
> a few changes on top, after all)? I would appreciate it, thanks in
> advance!

I've just tested rust-next. Looks like all arches (x86, riscv, and
arm64) works as expected.

> To be clear, I didn't re-check every single thing/combination, but
> hopefully what I caught helps. Since there are no users anyway (of the
> last patch) right now, it should be fairly safe.
> 
> Applied to `rust-next` -- thanks everyone!
> 
>     [ Fixed typo in macro parameter name. - Miguel ]
> 
>     [ Remove ending newline in `ARCH_WARN_ASM` content to be closer to the
>       original. - Miguel ]
> 
>     [ Avoid evaluating the condition twice (a good idea in general,
>       but it also matches the C side). Simplify with `as_char_ptr()`
>       to avoid a cast. Cast to `ffi` integer types for
>       `warn_slowpath_fmt`. Avoid cast for `null()`. - Miguel ]
> 

All the changes look good.

Thanks!
