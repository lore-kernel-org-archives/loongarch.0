Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24111288524
	for <loongarch@lists.linux.dev>; Wed, 23 Jul 2025 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753264338; cv=none; b=FRC/6wFFNR0zTIt2XRRavMFso+RwY+ZM7GoWVN5HpHvkjk/1TnsWchKijfLQf7ydEXHNGUEMcdvVzGZlo/BimfDGQ5ZXrpl5v+fdvjc/cSBYABWdEwLT4aYj9pcRIsjLSq21uJ8/KxW6zExT2RCsevuEgnbUwDlkO0DaSRuq9mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753264338; c=relaxed/simple;
	bh=N/dbalNatsU+qJPlZyF8dzo8wixIe5QIEqdKyRkmytU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5TPqthmNoTnpWyeSFj5AeapZ6XhOOR1MMVwwlNme/G1qAex+5i1dPlqt0YAmgovhHOKpIjONrhE78i6MkhkfJNjx8FGmLKrBiLjOTdFbgAOSqHrL51nk7wqiqa8ng2CnJ/1ToF/UH0Zx0b2x6QNFru+WJkrRYcAsEgBI3g1Ixc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiXM17cJ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiXM17cJ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-31306794b30so294961a91.2
        for <loongarch@lists.linux.dev>; Wed, 23 Jul 2025 02:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753264336; x=1753869136; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+/dV0S/yM5ebUUQww27WfFYh9svGL82SiTI5/e7B7U=;
        b=FiXM17cJbcCIVuZ99hWZZ3IDfWaNfv/IwcbF9+56mLl/hFiSePqdkw5ECu9vVBPzcg
         CdJ3B8IT0IuEyA+uCguqqUhrH22jR+WPCn9WsMDT1zxBEZlIqg1WdWR7dipyF/70AkfC
         TOG3jaUdvxSxtw408iSu1NHxzub5SZm0QR9WLt1nc7Xtcb3NnmsUnyrm8JmNUt+8NTzu
         3NYfCQdSrns70G4X7SBQ268YhOVioqwOVV8ouZZHEtierm7BKQQGqjMfkbmwsA/oD5/r
         SiEqdanbsoA0FncrnqXEIExAwR2KS4pFRbVFJ4MjywBds0YnHQe9DqSyZLuq2soobi2c
         lRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753264336; x=1753869136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+/dV0S/yM5ebUUQww27WfFYh9svGL82SiTI5/e7B7U=;
        b=ODso1ipBcDceGFFGVBA4Xq1zdcAeX9yWGq0LJLoMjFXBjk56uRhOTjqP75FJJIyOSR
         4sHhye5mjrcJP8aoV/6mXW87lgo1BCng4zShQDwanVWmfwCk/lesk6U48DgvfpO8gC7Y
         ArQWvltdft+JLI3Lysqah1631f4uzpKkbsCusgALKeWZcznf95aLZ0mSDV6mXhXXj+3A
         ggQ8t02lnckLX/OoFRoKZjSdpjAwWY+UR+tGxjFSdoDO0apnAIzQuSFh32GQWmsq2krj
         +IT2kVmiLi+/y61AP0OHeHoXNGrGq4lRB5UbvHdpzoffiJ2BL9dFP4d2HvQRS0sqT7zg
         8QtA==
X-Forwarded-Encrypted: i=1; AJvYcCXAWhlAux+r2f8UKeTRxbqQHtswKWWLRbvJDvzvNukCFdQD3izDFVtDbN5cM6iNhAkfkWXAaLI1k7g=@lists.linux.dev
X-Gm-Message-State: AOJu0YyA4nUrKZUBv7CdFzo4oOecYDmUn7vmZD2ozluWzK7rDD2MX7TK
	K/tHESYEp2/CVKbikCxuSSmKeUrXzERhg3coKNyseFg9HRRwpPWFLdjjFWsCJXUkYiKlovNVUpT
	GcZY9YXuONdSqyyUAbV5chKIHH1HpjuM=
X-Gm-Gg: ASbGncuR8yrhWNkFjmJJOhROAeYI0xLs2dYndJhEoZi5PVblwbLAL9zrZyX5mXmPQqo
	6v+SBM3vnZ0SeGIhRwjjS65E10IMV1wHCVjRloZ13O3eb0qKQXexEVobJ/nEIFLRdxh6bT7HhCR
	LroYe+JGABCzY/0Gn5OIwUiGt060UVWY7Un5cmwdL6k4D+mG0If1qmj3xj8OzJl2k31XVL7TaPt
	Ed+VVmq
X-Google-Smtp-Source: AGHT+IF5yp3x1uoUnaGZMoJBe+fzYcdYddNENz2TuSijJoibHeDm9sWJWjMzhPHdSfVi3F/pn5nO7IChbp80rUU+c7Q=
X-Received: by 2002:a17:90b:4a47:b0:312:e76f:520f with SMTP id
 98e67ed59e1d1-31e5088598emr1376264a91.8.1753264336236; Wed, 23 Jul 2025
 02:52:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
 <CANiq72=Hr5rg7tYta8aUoxt8hOPjR2ik5_-xMWZwacr63=-7KA@mail.gmail.com> <20250723.152042.1300024463910400.fujita.tomonori@gmail.com>
In-Reply-To: <20250723.152042.1300024463910400.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 23 Jul 2025 11:52:04 +0200
X-Gm-Features: Ac12FXzZ5eWdKPVCRlnoxNrP6D3TFPlJaL8XzNsPkRFhVqP5xsNvOO-4LiDYGFY
Message-ID: <CANiq72nLQkJo8voGONJBEgE8st7=A4RW7VP+W++SVCWse49n=Q@mail.gmail.com>
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

On Wed, Jul 23, 2025 at 8:21=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> The patch for arm64? I tried to minimize changes to the original code
> so not intentional.

The riscv one, i.e. from the range diff:

    @@ arch/riscv/include/asm/bug.h: typedef u32 bug_insn_t;
                "2:\n\t"                                        \
     -                  __BUG_ENTRY "\n\t"                      \
     -                  ".org 2b + %3\n\t"                      \
    --                  ".popsection"                           \
     +          __BUG_ENTRY(file, line, flags) "\n\t"           \
     +                  ".org 2b + " size "\n\t"                \
    -+                  ".popsection\n"                         \
    +                   ".popsection"                           \
     +
     +#define __BUG_FLAGS(flags)                                        \
     +do {                                                              \

If you look into the `.popsection` line, your patch adds a newline,
but I guess it was not intentional. In x86 there is a newline after
the directive, but there we have `extra` afterwards.

(I noticed since I went to expand the macros in a dummy file, given it
can be something tricky to spot differences in the normal diff, but it
is visible in the normal diff.)

> Yeah, I followed the original code style.

And here I meant (i.e. the first part of that paragraph) that:

    -                    "\t.org 2b+%c1\n"                                 =
 \

now generated those two spaces around it:

    +       "\t.org 2b + " size "\n"                                       =
 \

> I've just tested rust-next. Looks like all arches (x86, riscv, and
> arm64) works as expected.

Thanks a lot!

Cheers,
Miguel
