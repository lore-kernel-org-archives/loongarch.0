Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B920E4A1A
	for <loongarch@lists.linux.dev>; Wed, 23 Jul 2025 00:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753231715; cv=none; b=qbS0sxUvhEp8HfXvEEW4C83oMJcaP4xvEByPQhqY1AX0PYSW3oygBVJUc7+LaFZ/Yp8YG5ndfKDZa32wIX/XVTBHPGyXKQZKxU9t5bJ/H6M/mBL/0z1m37swGSOnU6CfiRR7GNP+QAKVJ6vuinYO6Cmvl8JxIrCaeBR80mQ+X/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753231715; c=relaxed/simple;
	bh=fYQuLA5qMz03a7AGBgthH1t+FyaBC1FDyitoyKLvjpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyhFB0xo/CjqYprWPt97XikIGU+l+KISVLkjWIlWa5bsU4SVGgkGMtO/7LJlJWvKQS1CvYVqldhYF8JtwB1MeCbxIf8xYPJ0rpPizKn9aktGI/PQ0cQvXkls1Rlg3e+75ONkOHLcI+mC7Fe03YpllUB2y6YTLSDuLXrnYG+AmPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1LAIiQX; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1LAIiQX"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-31384c8ba66so335462a91.1
        for <loongarch@lists.linux.dev>; Tue, 22 Jul 2025 17:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753231713; x=1753836513; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDWwMCWNmNg13/uNfIiBkoY/WSAIAnYmTPwjUuO5SDo=;
        b=C1LAIiQXtplwNNSO8dzHsFa96gTx2l0yviqlSo5xcSQhdTezEeu8lnOypT3Vj1gwwl
         074lu9/QQ1O7NKmlLslhtoqVq1geZW2YHvoCqY/mK01kaZWm6rqt/6Zi4wbdVqYw6OMQ
         ZRaZm87C70H/NMOLALNl17jT1LLGmLpnDbWW1M3XLaXrTmcj+BIxenpmITbe+WATOTfb
         p9ZDGyDCJhM0JkuQTu2jbFUsb7PpTwq+0LM+RArcEEbhEwjK9/hlfmrrhDDgOy9gEJ6v
         eA6QRap+vwq56XnrJ30Qhm3Ypbib1NDYJsTz9uJKeiZnWZ30wDJGd8ooMk+pjp8skDal
         GTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753231713; x=1753836513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDWwMCWNmNg13/uNfIiBkoY/WSAIAnYmTPwjUuO5SDo=;
        b=Cwp8hwohGjUg+Dov9EwXFO8L5jdf/d9BHoDtKpI5nnWbeWYKY6+5nYx5JzPkzH8FHp
         pwhd5aCcyyVl+wefNy5zdruXTLkb/x2xIQJmEnoPQsNtVcCQKAO7174sr9agiex4NFrP
         ugYMZEHRqzWGxqyj0BF8mpyGl7q5Bg8Ajmt5onIUXWbb5qx+RowYCcahzR1V7fgfY48D
         v+/PIiR7Nu+UWVln/Q9PR0DpRk2fRHrN/LCeTdL073HRutTM+ONEzYMnmN2LFivd//A0
         KqcIvi+ywR5tOLXL4sayDG1xKdKNCwun2kUf5ymwhuWj6gnbPFslFqwSE04vaXWJcOQB
         ZIrw==
X-Forwarded-Encrypted: i=1; AJvYcCW365d4xftswq9L1TfWixoXqcsH0iz0onHVYPpvBzM5xYwVLZq5jRrdroB59Vc3XYPkA3SxtUPMIPs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeThxh3yz9nFuQYHnxjL44WSNYm8SA2R38qWzndGqbox2quL6D
	OweWiA6cFSq/if8GNXkBPZGPh6Ker3blAnVfaleepP1YmVo+UBoFQ4RYar+MmDs3dl4ymqa0IYD
	mFiJ8VryakxBaaFs4LQ/uPNz8GSKlUVE=
X-Gm-Gg: ASbGnctYiU7t1vXToQAk8sahtAYknNXdM/ViXJB1/5Fta6yx8s2oUdVQ6FiEHENPmKw
	Lx8h2BAyzd3++ciSFlrKRP4fHR3f48ZkX+L3GMwkzV03LTCuZ9qi5ieya4S6V7AyH0wrHMvZaE7
	t1qoFGYim3DSiGDHz3ILi8KufURAAY0EysJ+/gXkijlSE7MCKivPYV+Z6F5IaWc/vBxRMBYUL/e
	RP/4cG7
X-Google-Smtp-Source: AGHT+IEROY3xKK1boGx8uMtw+7HtkmcD7Il1aBqwfuxTsZ79ub1lx8jvxICoebRQamqfzBv+TelUdZ/qR6LkFSGFHEw=
X-Received: by 2002:a17:90b:4d08:b0:310:cf92:7899 with SMTP id
 98e67ed59e1d1-31e50812d7cmr712415a91.3.1753231712760; Tue, 22 Jul 2025
 17:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250502094537.231725-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 23 Jul 2025 02:48:20 +0200
X-Gm-Features: Ac12FXwgRZoR7Zgn1XC8m0WPG0N61nJSGet7-c0jdjdrsFebOoekk-VJ_EoxJF4
Message-ID: <CANiq72=Hr5rg7tYta8aUoxt8hOPjR2ik5_-xMWZwacr63=-7KA@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] rust: Add bug/warn abstractions
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 11:46=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> This patchset adds warn_on macro with the bug/warn abstraction that
> utilizes the kernel's BUG/WARN feature via assembly.

Ok, let's move forward with this.

I took a look at the first three patches and compared the expanded
output for the existing macros, to make sure we (hopefully) don't
break anything else.

It seems OK, I only noticed a removed newline. Was that intentional?
There was also a bad parameter name, but that was not hurting anything
since it was unused.

(For the x86 one could be closer removing a couple spaces, but it
should not matter and other x86 files format it that way, so I didn't
change it. I also noticed unexpected spaces used for aligning the
macro, but it turned out it was in the original already, so I left it
also unchanged.)

Then I found a few more bits on the last patch.

Tomo, could you please double-check you are OK with all the changes,
and please run the tests you did back then on `rust-next` again for
all arches, given it has been a while since you posted it (plus I did
a few changes on top, after all)? I would appreciate it, thanks in
advance!

To be clear, I didn't re-check every single thing/combination, but
hopefully what I caught helps. Since there are no users anyway (of the
last patch) right now, it should be fairly safe.

Applied to `rust-next` -- thanks everyone!

    [ Fixed typo in macro parameter name. - Miguel ]

    [ Remove ending newline in `ARCH_WARN_ASM` content to be closer to the
      original. - Miguel ]

    [ Avoid evaluating the condition twice (a good idea in general,
      but it also matches the C side). Simplify with `as_char_ptr()`
      to avoid a cast. Cast to `ffi` integer types for
      `warn_slowpath_fmt`. Avoid cast for `null()`. - Miguel ]

Cheers,
Miguel
