Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DA7183CD9
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728560669; cv=none; b=hFbLYP6h59K8x9euyA0XRWmYJVHOyw8Bh2eFFO/o13ZCdo6/GNoMcCundBpiuuwpWX8DKye+s301868P26xmWnp6/1JUGcJSO00HfqzsL6Y2L53AN3vuJ654LEJa+3NaL9XHcbXU35LXEsEH+vMIGKUL/S8y95Z8hcQ61OxEuTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728560669; c=relaxed/simple;
	bh=2bcJ4+CbIja3RwWUGVJCLGPSRxnGjLzpAXTiDnP2l0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jaLFLANE5paT0J/7KV8ShCG68r9gxujlireYCS+D7cBc5zTpLprM5CYRi7d1ZSr7fLF5B/Y8Dcy80Yw3x03piy8jn7nDksTTISLg8aNsng7S9YnpH5lTYWWuwGeAOKjiu7dxWiAkFkB74ITGa7n1TeXHQYzYsBHmZpFBjVOmWnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AT7Hil13; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AT7Hil13"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71def8af0d9so41706b3a.1
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 04:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728560667; x=1729165467; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bcJ4+CbIja3RwWUGVJCLGPSRxnGjLzpAXTiDnP2l0k=;
        b=AT7Hil13bui6XA+GgDvgyJNt655G1jUSrVUBUBEHPzOZPD4Yq1DWb9BYRkwaHGQL9o
         y4SRkCnLvfMWEIm5/AxU4kvWeCow/HkP1OcT8pEjvD+HjVeif2LtQ2X0sWS6AifaV565
         deMmvGhHjhgoq4kayzvFevChxYHgPLqripN5Vy1Jouhxo1KU01jGgpqghfwkGu7x3Tty
         zsZgdX5Jg9wUpHXHpDca7WeoNYIDcgRTFTjYSfRMicoqqQJzTyHasDhs8XCzbLm5Rb2c
         KjVRpQERZhldSm6rHFcXdkwJTs0Cs61MlS2PH8xs3ZMT9BEVzAtOhcguqwrz3Pov16ta
         mcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728560667; x=1729165467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bcJ4+CbIja3RwWUGVJCLGPSRxnGjLzpAXTiDnP2l0k=;
        b=ACvjYjG7IOqh8EKojBuPCf+1aiiZwnhoAPoOMLSrgwLQAHh0LuZ40DLJCDs+oRLI+j
         U/2jA/MO4pnXRMJLs/FHg9L4l962DrIq184TnHstrXm4+4tdGzFw5KYQrHBG5YpONpfN
         cdCtwwg1by2XNlRX3jzdP32lfajUTfke2nwrZnAgLt4yIgkIES2rO15ifNLmEPKytyB8
         C12b3LlUp7w/G3k+xIWnh6yLg5htN4DQgc0WrsUTp1f/n8Q8KhYRsdyJ+PWLoRjJp3GV
         LHMpOfrpsmV0qi45lJHVPRExnDOaweN/9VadNSZWfadShOHslb6mNOXdS+W7kuALZVOQ
         MSZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcYkGARa9ZWtoOX72tMWUAVdYhw4UcNj4DguaEOaFLJVYvN3QhbXY2zicnTelaxFYFOFKjwL/1SYE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy42VxEtVO1NTCc5ePJ421GnuG0zuJZCbyLFKQrMaMtPRZXzTI3
	HiPLdj9cXV15tfXfNHGj/Kpv35PjHxbz0IkY5QUPvoYmE/a3E8p6eCpkvVzs7075guIGy05Zg/+
	d+MjCTNj2vJrvZK1DKzCd5EVTChc=
X-Google-Smtp-Source: AGHT+IHld3yA7pZMM4j9W1AYfJL3YZl/msv9ucSw1eVQ8vGB3wsRDok/Qzcvy2JYC9NwbCxsuNZ/OZ5hbL022PTBeCI=
X-Received: by 2002:a05:6a00:2d97:b0:71c:5e1b:6871 with SMTP id
 d2e1a72fcca58-71e1dbc8d89mr4146646b3a.6.1728560667291; Thu, 10 Oct 2024
 04:44:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
 <ZwbAvEnrzu6UUgGl@J2N7QTR9R3> <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
 <ZwewMw8jBh6OU-L_@J2N7QTR9R3> <20241010110344.GL14587@noisy.programming.kicks-ass.net>
 <20241010113748.GL33184@noisy.programming.kicks-ass.net>
In-Reply-To: <20241010113748.GL33184@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Oct 2024 13:44:14 +0200
Message-ID: <CANiq72=kT9RFcQ3h5U+wAY0pDQQqGU7BTtiPJ-oiHNUG00z3=w@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alice Ryhl <aliceryhl@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 1:37=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> So much for the debian 'rust-all' package actually including all. Thanks
> Boqun for telling me about the rustavailable make target.

Yeah, `rust-all` does not seem to include `bindgen`, which I guess was
the issue (?).

I guess you have it working now, but for the next time / others, we
have the `apt` line for Debian at
https://docs.kernel.org/rust/quick-start.html#debian.

Cheers,
Miguel
