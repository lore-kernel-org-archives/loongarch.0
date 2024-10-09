Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DACE17798F
	for <loongarch@lists.linux.dev>; Wed,  9 Oct 2024 20:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728506009; cv=none; b=gWFc04RLflhRSfoid/AW/DuRAn6fdXteOQxXJr5sXq3N6xTDHRC+FmgcNt9oNsYKnRNiKcuivzfAir+Umy8QZ8zucRj5VgXUbROQtB8WAvoWzGBb1uGKnWb5+nWrmiMXlV3180nKXbwYPFXF/MTammyS3qd1dYqItvFjwTook6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728506009; c=relaxed/simple;
	bh=g3Z6xVqchyvePEhyFbcGCbGYDr+RxMXxMhTkzYEJUwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxJ5P8knbxbutTF4LU2wNPqnMsttJYsjbVOze0T6QlkH+xTmW0CLz07BXoOTWqh+dsxunI5bgvTM4MWfINPUkqZsNat3ShHl80O/wVG+6qCGgioVYMRDlPa5w/bQkRMetAq1WGOJKUkud0EPsHJlEZK0BusxTZrt0tkuzyX37Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fIxcCDSr; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fIxcCDSr"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4601a471aecso20851cf.1
        for <loongarch@lists.linux.dev>; Wed, 09 Oct 2024 13:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728506007; x=1729110807; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3Z6xVqchyvePEhyFbcGCbGYDr+RxMXxMhTkzYEJUwc=;
        b=fIxcCDSr83EeJujQa7Ukf43KVewSeEawmUAqgB6WOHxsUfedQEVhY5+LzKs1V0p1W9
         cMhE1iutswZj+uBvxlW9QCk5bFwTb5WyliuU2ZIrbV1Q1jpSrYr3RlP7K/WtclwYPMcF
         pCBEkf3JLLdiE9M5K0ns5NBJfZEUYhk49Isgd91R7XgFSY2cl65u8wsfV7Yzm3cfnLW+
         KQlKlKR+ALZMm4eIcwl3JxwAh7qHy75QL0QWUrrntkLb7o9bG0h9o9ABGEY12YaWyNxf
         cHAwbPiioZs+2Dw1sSkyN2nkJdJ+tbcHacKjh7yFksEXvuhMQUdIMl9a1dfT/MEQHF8q
         fW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728506007; x=1729110807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3Z6xVqchyvePEhyFbcGCbGYDr+RxMXxMhTkzYEJUwc=;
        b=AwLaEGUTXrJSn7Nz9yZqKMGPE7cS/PZUlKjgKkZtee1gpFZDxvHUVLSHYo2TSrvYc5
         Y/pQ5WbJCRL3SCB71B/7zYDKBHm84rpuTavO75xEtpPAcp/zgBao5NTKx8+0v9ChyN2q
         AT8CEXRoa9KMEO2r+hc36fAFU1PO6eHGskfDkhRFrn48E+WITu3+ky/89SWNJI4yYLvr
         rRcNsdYKQQ67ULUiFDT6RK757gjt7BMMWmFLGR4OYZTLBFTfDszUlkPIjSEDeBqdf6IS
         ymwjCWfgoEX4XVtBOHx/w/N+RBzKkB1qbduq2LH7B9RAuxYgkkg5OTww+SgPGOoBCO8N
         uO9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCIX7ezDRuLU0CnaldHKAjYfJ3XtTAMIjcACUmsKnHRKBVSIcRso75Kj+LHpWAH4s2R6QaHCLCx6Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0OhdjdOv+91EXEjmlhCHkmsDriVVQ/R84kuVjWTCVchiJtWkD
	N/oAfZbvMsDwIBOpZhglR1wvHKilawtSyUOWFWbMNLpAIMuc51VwMD7poT7Zcf1gNnkth6pSqaO
	cRSWbyBq7+t8Cd/aNH/DQTAy7WZi1N4Vjq6c9
X-Google-Smtp-Source: AGHT+IH2eHhPIlYCkvIKDRvl0HccBxY6IuEQCiXmalbJ952EMdFHDlwr+M0C26/wqu6RWinAzZSETQFZjxJu8xv+JI0=
X-Received: by 2002:a05:622a:5497:b0:447:dbac:facd with SMTP id
 d75a77b69052e-46040469e85mr751951cf.24.1728506007151; Wed, 09 Oct 2024
 13:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
 <ZwbAvEnrzu6UUgGl@J2N7QTR9R3> <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
In-Reply-To: <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 9 Oct 2024 20:32:50 +0000
Message-ID: <CABCJKuej95SJjJuCuzwFpPUJG+iprc=gFgnZmuAE_MU5yMAppg@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Alice Ryhl <aliceryhl@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthew Maurer <mmaurer@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 8:15=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Wed, Oct 9, 2024 at 7:43=E2=80=AFPM Mark Rutland <mark.rutland@arm.com=
> wrote:
> >
> > There's an existing incompatibility between CFI and pre-function NOPs
> > for C code, because we override -fpatchable-function-entry on a
> > per-function basis (e.g. for noinstr and notrace), and we don't
> > currently have a mechanism to ensure the CFI tag is in the same place
> > regardless. This is why arm64 has CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
> > depend on !CFI.
> >
> > For C code at least, just using regular -fpatchable-function-entry=3DM =
or
> > -fpatchable-function-entry=3DM,0 shouldn't change the location of the C=
FI
> > tag relative to the function entrypoint, and so should have no adverse
> > effect on CFI.
> >
> > Is Rust any different here?
>
> Ah, no it shouldn't be. Sami can you confirm?

KCFI is implemented in the LLVM back-end, so the behavior is exactly
the same for both C and Rust.

> > As above, I suspect this isn't necessary to make CFI work, for any case
> > that works with C today, due to -fpatchable-funtion-entry being
> > overridden on a per-function basis. Are you seeing a problem in
> > practice, or was this found by inspection?
> >
[..]
> Well, I was told that it's a problem and was able to trigger a failure
> on x86. I didn't manage to trigger one on arm64, but I wasn't sure
> whether that was me doing something wrong, or whether the problem only
> exists on x86. We already have the flag on x86 for FINEIBT, but I
> thought on the off chance that it's not a problem in practice on arm,
> it still doesn't hurt to add the flag.

This only impacts KCFI on x86 at the moment. However, we should
nevertheless pass the same patchable-function-entry flags to both
compilers on other architectures too.

> Regarding the AAPCS64 calling convention thing ... rustc uses the Rust
> calling convention for functions internally in Rust code and I don't
> know whether that changes anything relevant for what you mention.
> Matthew/Sami do you know?

AFAIK this shouldn't be a problem, but Matt knows this much better, so
I'll let him explain.

Sami
