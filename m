Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5791991B6
	for <loongarch@lists.linux.dev>; Wed,  9 Oct 2024 16:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728492522; cv=none; b=fAhjvhW4kTQXfrUAZestsjq+VrbXKPcB7cG13y+Y0K5QgRKL4uYYkfQLuSi4qHba8b3QxgK31GtjFRC6BrH5edq5634r/E+1Nugt7aFz4G01ixPvknxkWd0o+RjZTUpxIWe+Y1a3HoxlugXSLBzEEZmApez0W+cup+uJZAPh2Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728492522; c=relaxed/simple;
	bh=gdKn2odBMpIYhY6Ml1GXd8IVWbn6t3Iuh+kBokXDOdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EwODYvi3/56oy9OifQPKzs1PmDvcDcQnWKouSeB4YtD/UFXxekyiN31Jsuk7kP50SgZwtvRAClPdt1bf6FGZy2wDTd6sI/tA54hbvAmLxShkwuZ6+Jyw0sqkBh7p9nXUnZ3xj4PJ5r79xza6Ei/33Nm9+XY2F9eCKSnXR008jV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ujG8EliV; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ujG8EliV"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4601a471aecso3101cf.1
        for <loongarch@lists.linux.dev>; Wed, 09 Oct 2024 09:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728492520; x=1729097320; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdKn2odBMpIYhY6Ml1GXd8IVWbn6t3Iuh+kBokXDOdM=;
        b=ujG8EliV23UW/pM99Q14D4XzBfETkxQSCI7FqHst6tHu0xF1+HE2gfTx9R+s29Cg6i
         jPN2d9k/4lWoeX4wB7Q8VdqkxsSSRVYXa1Zg+Fu0zW6tkrDcPy+x2PW9sWgQ/MlRWBfZ
         V5LGQ0jf4m1CtssvIuSHpiCvrXxBJZsD7OCWdrk5bqp/9KmvwMWMY32nh79nqoNtQSfc
         lJGI8A8VCs5e42Poanlv1uRI7pD/MdNGnvOd/+1KBOHV3OY5celKaNOgfyiqP53ba9K1
         R4pZdatm5DTPVoTuFpX5eWYoMxPzciI9bU7dVu5Vt2T/jByC80tUHGa6LMUuLo2uU6zh
         1pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728492520; x=1729097320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdKn2odBMpIYhY6Ml1GXd8IVWbn6t3Iuh+kBokXDOdM=;
        b=e0HiSoibLCK34BWO137SZE6ZfIc9mw4WDQBsfpnk3t8jL9WKDoQNf50TfqInicuy4k
         aHQAuMJMal5qGh5CZBC/X1CEq4DNubwzPHp00mBnbwzd8XdVDKp49VCjOJqnQ1oxMFuy
         yGg4BjOogKapm6KY+dG/BsNbORKfj8B5ccF+c9ljNUfmi88rOQsSY3ybWZBHbICd9hVw
         wf7bwNO4S5qn/LI+Uvc+DDFzuNRa2TeUEIk+W1duUWB0Yv+TP+U9jPbhB97Y5LlXDrwM
         7awSBIkL2TxQ2pH82QLzwE5JUtvBawZ3XthfiQaFMpOt+WG3eBGP5H8I1qfWwikGdA9c
         H7LA==
X-Forwarded-Encrypted: i=1; AJvYcCWAES2VnI6NldiJjGLEK4q9Hwp9a8Tg24sOSGsXyEJ4AIJeY5YhfLPnttzYzVd0C6tSV05z/Rk6E6Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFziCEycHE7U+5t2d/k8QWf9CyFe5JHMyOsNXcucAm/9kHWBPr
	08fPPl9QmGILWlCKtAxc5PrQ15zHsX4bWxPs/jC1pHzYO1O2QhjdNVnNlIt46B7j9Ik8w3yE7Ak
	875w1nr+L3hTLP7JSjEppLIAscQEhkJN5AOqA
X-Google-Smtp-Source: AGHT+IFU2+kjwmtE/tnFQrIWgevFZ6/YDFYn29RzthvZHDHMDNxdPEj2AOVBL4hcHNKv+c2nCcFEUJDPNG9SsF97388=
X-Received: by 2002:a05:622a:5612:b0:447:dbac:facd with SMTP id
 d75a77b69052e-45f0a1537fbmr4407531cf.24.1728492519801; Wed, 09 Oct 2024
 09:48:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
In-Reply-To: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 9 Oct 2024 09:48:03 -0700
Message-ID: <CABCJKuf83gywnbtkJ3d2VfDRH9f6kcf1Bn1Zau5re=4YoV6E8g@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 10:37=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> The KCFI sanitizer stores the CFI tag of a function just before its
> machine code. However, the patchable-function-entry flag can be used to
> introduce additional nop instructions before the machine code, taking up
> the space that normally holds the CFI tag. In this case, a backwards
> offset is applied to the CFI tag to move them out of the way of the nop
> instructions. To ensure that C and Rust agree on the offset used by CFI
> tags, pass the -Zpatchable-function-entry to rustc whenever it is passed
> to the C compiler.
>
> The required rustc version is bumped to 1.81.0 to ensure that the
> -Zpatchable-function-entry flag is available when CFI is used.
>
> Fixes: ca627e636551 ("rust: cfi: add support for CFI_CLANG with Rust")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
