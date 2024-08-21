Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B18513E40F
	for <loongarch@lists.linux.dev>; Wed, 21 Aug 2024 17:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724262905; cv=none; b=IcJwZCs5KmoFk7M9OTMvB9Zk4hsqqu8TJxc8pDmFsibDmr6oUSuKMkA7nsSl/lPDsXlN+Yv7Elskniwg5Y90yHSPA/VpEltviX085xBd13329XIFxgliMLJDg49NulBA2ywN5/MWI4RKP14UsCtkLgL0VaBthsw6BQgaOBrLywU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724262905; c=relaxed/simple;
	bh=gR41Sagi3MVianUSnce+ZoVIT1ol5TlwXr/MDVUkl4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrWZxgFcFDKXIh4S29KlmYMWU/CvjHh0rla/crSCbTT/YdAQNtOQF/G3uj4ihiCA8bt924s7r2sSXByMJZ46KxvstNnGsTRgGod30IarHeDqokZoj4hUTBuYMWU2MMwoon6ejt5BwV8d4QLKzBDwoeCh8rxqLBKwgEF2LFSFUvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ky/1VxUe; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ky/1VxUe"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71420e66ecfso123016b3a.0
        for <loongarch@lists.linux.dev>; Wed, 21 Aug 2024 10:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724262904; x=1724867704; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=99UTJcdmOMSq3QL9Ld/ZYDtqRpwRWCrHaSBTyLsenAI=;
        b=ky/1VxUePp9t+hKQnpFe6CqqSmXshsp/jZXk21SZEQAqE4ebMLdM7pJG4UiX+7dDmW
         W4RBB99QPRPRasLxoWcU7GFH2ZhaV9BTuaZ7kd6xqJkXuXRnv7d3qWaTXXws2g7EZcEM
         ZF67PRBvgdg0rXYhyrywdhG1elXgd95j207OqfQYCe8GoBmNGuGafUSYlm/r0HbJj8pe
         GniXScp+wpAGD1BEdww6SqkryQgzFEJKthRuZIhwRypO1niRR1oDCwiAExv5yfeiiOYR
         v4h82H+xHe1RKKU3aRI+3U/Bd3D4fV6d50tpU2hg/HvVp5vRJbwaWkDb/6wS8W4zu2Ch
         sPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724262904; x=1724867704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99UTJcdmOMSq3QL9Ld/ZYDtqRpwRWCrHaSBTyLsenAI=;
        b=sMbb+G5rp52jdC5ovCsfSZGvAxw7JPbaPgA/VtzKUofskDb4Elogiuuh4bg1ozdx+y
         8jISiO73sxk5Zv3UxOCwoNZvbAnIVS2xRc9szkD4VnhPfr+yE3943ZstK+yHnyAn2ca4
         A6NVIDYyuq8OKFQTQX9vJEchWoyG3BPlpfsxD7DFlsNZbxMl3uc9RJSGZhnIDegk+Euk
         ymiYvVY159lUurHFmOqsXSMvSu2OTaj5zJMO5gGgqQHy7L1kYlrA+6wkP4nb9cOOdAPe
         VV+Yw0zJEH9X+SCthRFEdo/LfJmVSXsATJLF73CsRUEzW4kmeCxXiIbFNGb6NI1Rr5yH
         cCbw==
X-Forwarded-Encrypted: i=1; AJvYcCWaobE4x3ZdsCqiXM39r02d6n/aKRBb2rgtcSYm1IGzDYqPUtCXLWS6zV24WVBXHZ9Ls0C9P8704bM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzroJg9xjuVIApGnXPX9ybZD25C9I6y+OB84E0+9BpyARG2WVda
	VURXLnVxIkdFGI/KghUaC09YvndhMz9h1x66t0dB3PtRnNaUsEY63deZ3FC/Jt89YYA+kzAG7W3
	+71KDc3PXCPmEScYMlP8PZPQiMh4=
X-Google-Smtp-Source: AGHT+IEzWQ9FWxtgUqDPIkbMELTDsn643+uCsx+x59lAbwOzM67Cgp8McbVys7i78Q39WJ4bizO6S55PWpHdgZM9zIQ=
X-Received: by 2002:a05:6a00:2d90:b0:710:5243:4161 with SMTP id
 d2e1a72fcca58-714235d73ecmr2136069b3a.5.1724262903448; Wed, 21 Aug 2024
 10:55:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240816-tracepoint-v7-0-d609b916b819@google.com>
 <20240816-tracepoint-v7-5-d609b916b819@google.com> <ZsYfAFrBFVewchGM@boqun-archlinux>
In-Reply-To: <ZsYfAFrBFVewchGM@boqun-archlinux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Aug 2024 19:54:51 +0200
Message-ID: <CANiq72np8GhZ4V22b7RekvQOhCbM67A-19Px2aVLgweC4Qxebg@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] rust: add arch_static_branch
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000dc2d130620353d5b"

--000000000000dc2d130620353d5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 7:08=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Have you try this with "make O=3D<dir>"? I hit the following issue, but I
> am rebasing on rust-dev, so I might miss something:
>
>         error: couldn't read ../rust/kernel/arch_static_branch_asm.rs: No=
 such file or directory (os error 2)
>           --> ../rust/kernel/jump_label.rs:39:17
>            |
>         39 | const _: &str =3D include!("arch_static_branch_asm.rs");
>            |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>            |
>            =3D note: this error originates in the macro `include` (in Nig=
htly builds, run with -Z macro-backtrace for more info)
>
>         error: aborting due to 1 previous error

Yeah, we should use a `*TREE` everywhere. In addition, we should not
use `SRCTREE` but `OBJTREE`. It is my fault, this comes from my
prototype I gave Alice.

Please see the attached diff.

Cheers,
Miguel

--000000000000dc2d130620353d5b
Content-Type: text/x-patch; charset="US-ASCII"; name="objtree.diff"
Content-Disposition: attachment; filename="objtree.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m045ljec0>
X-Attachment-Id: f_m045ljec0

ZGlmZiAtLWdpdCBhL3J1c3Qva2VybmVsL2p1bXBfbGFiZWwucnMgYi9ydXN0L2tlcm5lbC9qdW1w
X2xhYmVsLnJzCmluZGV4IDc3NTdlNGY4ZTg1ZS4uY2NmZDIwNTg5YzIxIDEwMDY0NAotLS0gYS9y
dXN0L2tlcm5lbC9qdW1wX2xhYmVsLnJzCisrKyBiL3J1c3Qva2VybmVsL2p1bXBfbGFiZWwucnMK
QEAgLTM2LDcgKzM2LDcgQEAgbWFjcm9fcnVsZXMhIHN0YXRpY19rZXlfZmFsc2UgewoKIC8vLyBB
c3NlcnQgdGhhdCB0aGUgYXNzZW1ibHkgYmxvY2sgZXZhbHVhdGVzIHRvIGEgc3RyaW5nIGxpdGVy
YWwuCiAjW2NmZyhDT05GSUdfSlVNUF9MQUJFTCldCi1jb25zdCBfOiAmc3RyID0gaW5jbHVkZSEo
ImFyY2hfc3RhdGljX2JyYW5jaF9hc20ucnMiKTsKK2NvbnN0IF86ICZzdHIgPSBpbmNsdWRlIShj
b25jYXQhKGVudiEoIk9CSlRSRUUiKSwgIi9ydXN0L2tlcm5lbC9hcmNoX3N0YXRpY19icmFuY2hf
YXNtLnJzIikpOwoKICNbbWFjcm9fZXhwb3J0XQogI1tkb2MoaGlkZGVuKV0KQEAgLTQ1LDcgKzQ1
LDcgQEAgbWFjcm9fcnVsZXMhIHN0YXRpY19rZXlfZmFsc2UgewogbWFjcm9fcnVsZXMhIGFyY2hf
c3RhdGljX2JyYW5jaCB7CiAgICAgKCRrZXk6cGF0aCwgJGtleXR5cDp0eSwgJGZpZWxkOmlkZW50
LCAkYnJhbmNoOmV4cHIpID0+IHsnbXlfbGFiZWw6IHsKICAgICAgICAgJGNyYXRlOjphc20hKAot
ICAgICAgICAgICAgaW5jbHVkZSEoY29uY2F0IShlbnYhKCJTUkNUUkVFIiksICIvcnVzdC9rZXJu
ZWwvYXJjaF9zdGF0aWNfYnJhbmNoX2FzbS5ycyIpKTsKKyAgICAgICAgICAgIGluY2x1ZGUhKGNv
bmNhdCEoZW52ISgiT0JKVFJFRSIpLCAiL3J1c3Qva2VybmVsL2FyY2hfc3RhdGljX2JyYW5jaF9h
c20ucnMiKSk7CiAgICAgICAgICAgICBsX3llcyA9IGxhYmVsIHsKICAgICAgICAgICAgICAgICBi
cmVhayAnbXlfbGFiZWwgdHJ1ZTsKICAgICAgICAgICAgIH0sCkBAIC02NSw3ICs2NSw3IEBAIG1h
Y3JvX3J1bGVzISBhcmNoX3N0YXRpY19icmFuY2ggewogbWFjcm9fcnVsZXMhIGFyY2hfc3RhdGlj
X2JyYW5jaCB7CiAgICAgKCRrZXk6cGF0aCwgJGtleXR5cDp0eSwgJGZpZWxkOmlkZW50LCAkYnJh
bmNoOmV4cHIpID0+IHsnbXlfbGFiZWw6IHsKICAgICAgICAgJGNyYXRlOjphc20hKAotICAgICAg
ICAgICAgaW5jbHVkZSEoY29uY2F0IShlbnYhKCJTUkNUUkVFIiksICIvcnVzdC9rZXJuZWwvYXJj
aF9zdGF0aWNfYnJhbmNoX2FzbS5ycyIpKTsKKyAgICAgICAgICAgIGluY2x1ZGUhKGNvbmNhdCEo
ZW52ISgiT0JKVFJFRSIpLCAiL3J1c3Qva2VybmVsL2FyY2hfc3RhdGljX2JyYW5jaF9hc20ucnMi
KSk7CiAgICAgICAgICAgICBsX3llcyA9IGxhYmVsIHsKICAgICAgICAgICAgICAgICBicmVhayAn
bXlfbGFiZWwgdHJ1ZTsKICAgICAgICAgICAgIH0sCmRpZmYgLS1naXQgYS9zY3JpcHRzL01ha2Vm
aWxlLmJ1aWxkIGIvc2NyaXB0cy9NYWtlZmlsZS5idWlsZAppbmRleCA0ZjBmNmIxM2ViZDcuLjc0
NmNjZTgwNTQ1ZiAxMDA2NDQKLS0tIGEvc2NyaXB0cy9NYWtlZmlsZS5idWlsZAorKysgYi9zY3Jp
cHRzL01ha2VmaWxlLmJ1aWxkCkBAIC0yNjksNyArMjY5LDcgQEAgcnVzdF9hbGxvd2VkX2ZlYXR1
cmVzIDo9IGFzbV9jb25zdCxhc21fZ290byxuZXdfdW5pbml0CiAjIGN1cnJlbnQgd29ya2luZyBk
aXJlY3RvcnksIHdoaWNoIG1heSBiZSBub3QgYWNjZXNzaWJsZSBpbiB0aGUgb3V0LW9mLXRyZWUK
ICMgbW9kdWxlcyBjYXNlLgogcnVzdF9jb21tb25fY21kID0gXAotCVNSQ1RSRUU9JChhYnNwYXRo
ICQoc3JjdHJlZSkpIFwKKwlPQkpUUkVFPSQoYWJzcGF0aCAkKG9ianRyZWUpKSBcCiAJUlVTVF9N
T0RGSUxFPSQobW9kZmlsZSkgJChSVVNUQ19PUl9DTElQUFkpICQocnVzdF9mbGFncykgXAogCS1a
YWxsb3ctZmVhdHVyZXM9JChydXN0X2FsbG93ZWRfZmVhdHVyZXMpIFwKIAktWmNyYXRlLWF0dHI9
bm9fc3RkIFwK
--000000000000dc2d130620353d5b--
