Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477491C3F36
	for <loongarch@lists.linux.dev>; Tue,  1 Oct 2024 13:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789578; cv=none; b=E40f/VGvugtWtuItHtnKkyOssw5OANZRKFQa/wI9gqUQ8xtsxsjijjH9a16jEytKURPIQuS8tIOpEfIGsM7dRl1NvilaIVXF+C3/DJ7s6uPbCxyJ3pbKfnWghC2XWJqmrRi5Ymfgf+y7kJ8Wffe+oJQm/+zS7kBtxJS0Ga4hEpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789578; c=relaxed/simple;
	bh=jG1f8aoHpacDaHdb5KmywmlItDO2TWAWsVpCx9NXHQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LjljFAiA1DcWeuqVVML9olPxfzptKCdpvQfA/qziP7vJ8ycHelwrJgW7eB7TEzXDCX0PLnH6JyAjtA0PI7J3/x6ie/rg07fxLYh0FC5FHCYSPvNnqIkhrhHVnFW8Wo+HRNfBEvDTJyxhEwGjC/au5XzsKj/PWD/jnQTsq5Nl0uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XiVNoIJF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XiVNoIJF"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37cc5fb1e45so3770484f8f.2
        for <loongarch@lists.linux.dev>; Tue, 01 Oct 2024 06:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727789575; x=1728394375; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jG1f8aoHpacDaHdb5KmywmlItDO2TWAWsVpCx9NXHQc=;
        b=XiVNoIJFAZBg/XoHSAr9NstnPLpVIkAEU6PY/KspStnq+K+9AKa9jfiRGfC1/2GCN0
         yqWctdWJVrwpBaBXoeO8NmJugl3cIIxsATfRUqo+2L7IwpsFjyA4uzp2VIMT1qDhT9qT
         glBMKFlXakY4oB6+RNgnaig6qqJfHw9Q+aZ4+kyf9KK3m5eQNeiIWUD3F3Zl+PM02Hr5
         wSoSRL6mHR9wOfvlFhqYFYrP+jsH/je8ieKR+7vjA++kZmMkvBnNE1ZiOjAgpe/LYOg2
         zJNBPHwVFQ5lfeClSZprltLqh4/9bUoJaBcIpwQyR7Yy9lvwVmighcgno9G49PsRiG9Q
         aYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789575; x=1728394375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jG1f8aoHpacDaHdb5KmywmlItDO2TWAWsVpCx9NXHQc=;
        b=JjSVqHniQ81jC3jY4ug2dzESpLiEP7aZKbKwLkRvM+OD+8Bem1O1QnRip9qzBnyagH
         6HEusk5+TnQJk+mlnims1YKxhoP6jNf6Gt1riEVMK9c/7/e6gtK0eQwHs1mg7zP6dI9w
         fVRZ9Kz1Bruo2dDJq5aucd982qjX3wd4QN1kWLin1cB333nKE6WJDiWYjGM7F0KXzmOG
         0gPYtPWa4R7a27jdgqIF2xEJKzJU2nxXRmjw/Q0zaWeKdUhAtnF8QtOkhbxrRroZh19j
         KjxQQrXRGcjYy5qoojav1JmzUwHXSxPdwKlK0ogw07fW+KD0lzviONhpnG/ShOaABI8J
         VmQA==
X-Forwarded-Encrypted: i=1; AJvYcCUR1QmjdNWGJ5oa1iYUd1k5nUpERX4zOHG8nVAL0fcdgNpDngNEhmhu/rvTF4e/N4v/XcIdHhb3+yY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrYapgwgNKPRAlUgIdvAe8d9TlTSZx3oamZT0c7Wb1bOdYj2xF
	Qkyl7RLWe9mhr2q3domG3KkLq8stQwISJ01XE0QdCUeKIPY2aAAinGgbe0Gd8u1gf1GDnwBsjEm
	80Fj5xE8xFacp8n9XoHQ+zJv+zvWOCI7JmXcN
X-Google-Smtp-Source: AGHT+IHyQsBQmmP7WyMzsvnT7IUWl/PkBkfPPLhhwzoxkBXURriZ4Opu2OW3tEtRkPbGqwQWer73IFV8Bp15N9mptmE=
X-Received: by 2002:adf:e8c1:0:b0:37c:d261:3c6e with SMTP id
 ffacd0b85a97d-37cd5aa9a0dmr7774912f8f.10.1727789575379; Tue, 01 Oct 2024
 06:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240822-tracepoint-v8-0-f0c5899e6fd3@google.com> <20241001091527.2fe4e039@gandalf.local.home>
In-Reply-To: <20241001091527.2fe4e039@gandalf.local.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 1 Oct 2024 15:32:41 +0200
Message-ID: <CAH5fLghOiGmcpQZvOwn=d2Jyo5+CDA_cinbGjkmjTgSeusAC2Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] Tracepoints and static branch in Rust
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev, 
	Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 3:14=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
>
> Hi Alice,
>
> Can you rebase this series on v6.12-rc1?

Done:
https://lore.kernel.org/rust-for-linux/20241001-tracepoint-v9-0-1ad3b7d78ac=
b@google.com/

Alice
