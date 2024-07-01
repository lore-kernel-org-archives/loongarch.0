Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5E616EB6F
	for <loongarch@lists.linux.dev>; Mon,  1 Jul 2024 17:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719856344; cv=none; b=fj0Z2iCw/wqnwwSKo29L+uB9ONjSuF3qdJrbyezOYTyILTsaLUME4hkiVK/Hu/RB5vtrfbyR8Mw/xzOrfMJZGHkI+QbhZ5DYpxHLplJrraGE9yv39R0zOFwrWROjrFdqU7A02lDW/TgiETE49rsuwN3ljpe/P+BYPUFPPX1pDWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719856344; c=relaxed/simple;
	bh=wS5TzTy89GmwCCZj/N1TGJuuGTXmLGauqI7XlpF5kjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ntSJ1wW1KG9KmsMIqi4bG9rrfpvekyNrPHbt6Qvn9rLocnKyA0dUKg6q/iOYivHjb9tL032ENMtfSZsIXDmNLWECH5mh1ba/eYqTVpSlOs2Zl2d5wM4iewuepICyjMGoZPyn/2KwKWEeUCmPRfwYldN76oFCATXXAZSdmkAuFPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eyHA/hvE; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eyHA/hvE"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3645e9839b3so1921352f8f.3
        for <loongarch@lists.linux.dev>; Mon, 01 Jul 2024 10:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719856341; x=1720461141; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1/3Mqv5bU7Lm+/6Z/xl/QjEG/rO3YJRZuHHrfT9XMs=;
        b=eyHA/hvEwuSd80i4zsPUUIg1hPa6U75bLaDlGJXwTq+LdRTCr+cX3ax5zZlaPuX8eL
         0FY4eH/1W3ucg/cuYKb37/OefO6lcpBzQ6e827Pyxx+QgG5kJ88UO+BTtB9sLx0+eaJk
         gcVBEkJQymIEaEIIzoHTwS7gwc8CqMemRjvqIwM4BXSwcFEbSYmUoetaE62yz1xW6VvG
         oZBhw24wm8o8S7zQmU+hkyw+AevVBWZnZkGY49Mjm9ZlkxLiUj23owkyzJfvgR9KNizS
         gweoIbbUPmtIhUj4JTuetJcq329DvHEeb2ok5aKaI3Qd5tQ50rNt+qlXuPqllIWHMSKy
         /8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719856341; x=1720461141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1/3Mqv5bU7Lm+/6Z/xl/QjEG/rO3YJRZuHHrfT9XMs=;
        b=gTlE2ytSIhuZE+zM8Opvi1tORMz9xsIkSufDHpHFrN9f03McP5hQGeXqsI02xFlQvf
         2suTX90HYu7Fk2AtNHZjAJJPLElp5fm0fstJq2VJ/jLi+gqsanDN6T96x6hx9jO27peI
         hPwK+OGcO3ME1gVxugehLjyQteJaq2ywrtuhCl7WS/EdCMiEaEGYzSUNCJdPAhzJSLo5
         XlLge6vOoDbTb4ho8+kQkUrJhUzBmk9ixktX49hpwJUhX1QqEuJvreeNVYcPq33fkvow
         72H3uSac+RaOOq45za5oobpaY49TpB3eA01pTNquU9kT4Yq2Qk5TL4/dZMpyEC3lua7o
         2Umw==
X-Forwarded-Encrypted: i=1; AJvYcCW68LDmTcZCk3gNZOzMF/6CFm0GSWW71QHyWOrIC8nJAavbigwCc2If3jCXJbcJ9ppEzpSJuPUkEVefeFjBdNwNptR9xiKMZvHn
X-Gm-Message-State: AOJu0YxwrJlMp1TDef5FhrLV7iqySvMSejS05zFxs7y43moBkWcfVc/m
	oZ4X0ss2xvF7xA3KlJbJlnJyFvqYT3TMcNCdqkiBjhmk3m1SU1x9JPbLqlylJfR5jAxcDamo+QR
	QLe0dfTBKtaqq/W83ndJcfBIUu0iPHkQz5HWT
X-Google-Smtp-Source: AGHT+IG7kANdMixnrRX/w/wCL06WRJILCv9aR81l3eU1ucu2os0oVGFSDzYlK6U+a1azCoA3WAsnnYnMeJC+/F+ecm0=
X-Received: by 2002:a5d:49cc:0:b0:366:eade:bfbb with SMTP id
 ffacd0b85a97d-367757200admr5266366f8f.46.1719856341379; Mon, 01 Jul 2024
 10:52:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com> <171874683295.1901599.10170158200177384059.b4-ty@google.com>
In-Reply-To: <171874683295.1901599.10170158200177384059.b4-ty@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 1 Jul 2024 10:51:53 -0700
Message-ID: <CALzav=cwu3M2nLHwZLCTF=eGWx2Nq+=TuHMuGTfZCNa27mLs1A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] KVM: Set vcpu->preempted/ready iff scheduled out
 while running
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 2:41=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Fri, 03 May 2024 11:17:31 -0700, David Matlack wrote:
> > This series changes KVM to mark a vCPU as preempted/ready if-and-only-i=
f
> > it's scheduled out while running. i.e. Do not mark a vCPU
> > preempted/ready if it's scheduled out during a non-KVM_RUN ioctl() or
> > when userspace is doing KVM_RUN with immediate_exit=3Dtrue.
> >
> > This is a logical extension of commit 54aa83c90198 ("KVM: x86: do not
> > set st->preempted when going back to user space"), which  stopped
> > marking a vCPU as preempted when returning to userspace. But if userspa=
ce
> > invokes a KVM vCPU ioctl() that gets preempted, the vCPU will be marked
> > preempted/ready. This is arguably incorrect behavior since the vCPU was
> > not actually preempted while the guest was running, it was preempted
> > while doing something on behalf of userspace.
> >
> > [...]
>
> Applied to kvm-x86 generic, with minor changelog tweaks (me thinks you've=
 been
> away from upstream too long ;-) ).  Thanks!

Thanks for the cleanups. Looks like you replaced "[Tt]his commit"
throughout. Anything else (so I can avoid the same mistakes in the
future)?

>
> [1/3] KVM: Introduce vcpu->wants_to_run
>       https://github.com/kvm-x86/linux/commit/a6816314af57
> [2/3] KVM: Ensure new code that references immediate_exit gets extra scru=
tiny
>       https://github.com/kvm-x86/linux/commit/4b23e0c199b2
> [3/3] KVM: Mark a vCPU as preempted/ready iff it's scheduled out while ru=
nning
>       https://github.com/kvm-x86/linux/commit/118964562969
>
> --
> https://github.com/kvm-x86/linux/tree/next
