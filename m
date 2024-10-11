Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E781D0DFC
	for <loongarch@lists.linux.dev>; Fri, 11 Oct 2024 19:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676128; cv=none; b=Eebfjyv+bxqCa3LSJMLhsOGxoDYo9TFzb0HtPDFUfRoNh4mRvdQ0xCd6qZWcEHcomUYuCUiA7Zp3TOiGjY7mBNbxpi8tx+LP4vX/wGyoIdG2vtSCr/jilm0RNlBTOi0xl1EBsEivnaOj+X6sc0Eywj6Ca3Oqsaf5nk3PnnhZXW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676128; c=relaxed/simple;
	bh=eHR1pJM+yQAJRr+EhCLcm5xM2IPL3wNgQ41k9P8Ch74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIEblLOYoNyBrx2TBFhlVY8DmDGhN4nSsmWDVGK/nxd+QDPrNMnP2BvebZ7Oe0kYOrtnkt1pxOk+GpeJaJlfJx44Myl4g3e176XFkamLcoXhe5jwC/7sD9eBrbY2aMjo/fKLSiYv+ZhyUjvdCSI57WYUc/5zFcAuVKW8KRsBqL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PG9Ios+h; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PG9Ios+h"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e02ceccd0so294913b3a.0
        for <loongarch@lists.linux.dev>; Fri, 11 Oct 2024 12:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728676126; x=1729280926; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHR1pJM+yQAJRr+EhCLcm5xM2IPL3wNgQ41k9P8Ch74=;
        b=PG9Ios+hUBk7GEbQd9SEAZG6N+YNlxCQRqpAGJxftc6acUSMuEH4L3/jiLsSfcHll8
         ZK/6ypQVrtPiX+t7dHXadaF+ifj1WjUsYvw6kOQ4a0uQRNseaI/M8GbnSsap6H8I0+75
         dJRK3j2mpuhxlHrURjQ7hdGiOsjz6r2TkgNd3a2G7+NiYCneaEuggdK6dI6eeZAaSk5t
         j/bs9JanGtF1GbMfXk+v4wnNdFhorKs/rLP9pZ0XtiYtQU7jEPliWD7N86pzl5KYBf5D
         rMRuZUXdddRtxvuZHm9US6nyjeZ4tGY/6AM2MWnmO2MR4H6ePhP73OnJC1DFDlUfXsl2
         gTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676126; x=1729280926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHR1pJM+yQAJRr+EhCLcm5xM2IPL3wNgQ41k9P8Ch74=;
        b=uQ8f6CxyfWeXYFD9M93+6v1VeRqQj6c2tDk1twnt6vcWVW3mViLvzYvChXxHcXJRlr
         Z6phffydr9Qn58VJt4D2yWmPJKpqtlwvn+oxPYB65FqRgs1ZN/t0ZI6CGlUlQ1PcK0hF
         5KRYKm+AWxbeyEjZ4qeaKILqzu0inWHwT1ktxqqLYNN/F2L+TP1U6+GUQCrnf3JCSgWW
         tRorXpCqMNuawjcKkzwdkyS8GDHBEvBs0PeQVSKrL+CbSr96kFc+C15uTljUeh+uT9qG
         zPVL2VgrMiu7t8t4EDFRcuLNKz9onEiGAFpPENmaI45SIyb2O6t2pK0DnBj7/Hvbe3Ah
         nnRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0z8LxuahAuLVfPboZwDJ+P8YLWntiTvc/kmPwEA8XgVu+NFPXTE5wax6t11U+gpVa7PPDd3yIxPE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEbwTCvcEBJ48Nom6GjgtcMK9jY1xnBowCZ0Dn4xHnU6UNVgzc
	Ba7YApJyvnA0eLy/xyPeRBnfmQ7D5H4CaqQcTaWUbMZSdIMoF00I6R6ExmQdu5j4qWe2yg8+Xmj
	MqlyncQYrGl1pXdv3UkdOE5+QfkA=
X-Google-Smtp-Source: AGHT+IFm+UwkG6WIg1AqvuqnbDwrR2uK/LvnAOy5vxbnvuoTMa/HQ5sfAKze/sYR1OTnuhhXIrv49b/1Hp/O75r3s04=
X-Received: by 2002:a05:6a00:9494:b0:71e:3ee6:f8a8 with SMTP id
 d2e1a72fcca58-71e3ee6f918mr1949743b3a.1.1728676125868; Fri, 11 Oct 2024
 12:48:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
 <20241011-tracepoint-v10-1-7fbde4d6b525@google.com> <20241011131316.5d6e5d10@eugeo>
 <CABCJKuesYQWvfScFaqv_rW5ZqAJNn4zK9iOFAmyTaYKO3S5hgw@mail.gmail.com>
 <20241011171251.0bd53f01@eugeo> <CABCJKue7qT9drhgrXPEjBO=gPw79vYELAZxz747Z8WMF=vj2MQ@mail.gmail.com>
In-Reply-To: <CABCJKue7qT9drhgrXPEjBO=gPw79vYELAZxz747Z8WMF=vj2MQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 11 Oct 2024 21:48:32 +0200
Message-ID: <CANiq72nOCkzTyJCydHOrkz3MRizb27sDO_5Y_cKEv3oZDNNqqQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] rust: add static_branch_unlikely for static_key_false
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
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
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 7:52=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> It's just one line per helper, but sure, I do see your point.

I guess we will have a lot of helpers added over time, so even if it
is one line, it may end up being a lot of lines in total. The rules
should stay constant, which would be better. Having said that, it is
true the extra complexity of the rules isn't great either.

Cheers,
Miguel
