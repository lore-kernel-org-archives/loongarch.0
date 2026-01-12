Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E0B283FD8
	for <loongarch@lists.linux.dev>; Mon, 12 Jan 2026 17:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239591; cv=none; b=lKfSmqh/ygiQHhKpObfUIhLvPgoRTmcNI1YrLvciK3NJRpiQJ7TBtTbdq6LPuzFpKq/pG0SL6mf+TPmKVjydXLXoWQ7wIhSnn+LvEnxb7n3ZorRQkHLT8sdYaGdCtUL6jWl/lYsZZSYtY0oaaHCdcSW/l8xvxu7B3fmP5FI/uOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239591; c=relaxed/simple;
	bh=5WOjJJi9GshJrzbNszTXOCjQ/WC3CHWW6Rm24QuGEGg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YFWRVkbTDvyoQaKrF5/pcHEcFARqt4R+TDSbuvOrNHFSLmN9R5/tF7eFtSLag1PVUo9at93T7IBCnwaBskYuIFMy5uHdBAYAgiOB6gihv0U+OdQWBAbLhO82UHpnAmwOhP3//wLN10xixLLYN9CTCsJZ81e28xVvV8SKSOPPbvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kzUxNEP2; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kzUxNEP2"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ed2so5976760a91.0
        for <loongarch@lists.linux.dev>; Mon, 12 Jan 2026 09:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768239589; x=1768844389; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+PjBpIA3ZO3sQJJLy61/+UM/sv023xJCPIJTeEkES88=;
        b=kzUxNEP2PpWCXxbydVOO3yyaKN5ysoZ0LyCX8px3KQIEudwVOmiZoGllUHaAtTWbmP
         hMVlYFrIGdvWdW5M+3jOagJV1lvuj56GF09w58MzVhmGJwGbTuTmLf+3U1c/xMqcSstJ
         BzgC7RhedR/0yuJr1MnRiJAY6pHb3R8mAFuW/hVpS85iT6XIYlbdsUhkpNii8EZ/hAGb
         06KYgZWmCzYPK1yx6NzAAkUd3kWEz79bjJZJ+8CVbc6ZKUHOKMYu8TfG0Qe8zwxSTJAU
         8A44SZIvsfJGZ4Gz0h7omH0oE/6Pc6G6QTuisgLIK+D1J+9YxLG6rzLzlAU9omicM0oC
         YjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239589; x=1768844389;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PjBpIA3ZO3sQJJLy61/+UM/sv023xJCPIJTeEkES88=;
        b=HlcBn/9yAdaMtDFPzRVM7iWColyMeW7O3dF6VeKtPLzRgaWhY1vkExcadbEgIcUcYH
         Nlj1EQuV8aNhghn+AoCl/xZ1khMgkgJLTvczFILhLBFFkiwK/e+7dyJh4Hvsr1qFOqpq
         u0nPeffunIlzK140uhF1LkcBac9qRQDE4e/Z5G01ustzOzHkKKg4TCCYq78nKMul5Zxd
         crWR05eyoOTQyttA6rzycOAa2PU2JIoFn56nlcQlT/O6qGkfME4JvH0jn3lGz0wzHTeD
         orTE6I1e7QFEOMZ+8r2ZMbMcVnX01LdZ0fOZeivKbY+Uy+X0o88pcrC5EiHUe1Ko8fRU
         5etQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8xRsnovBh5ujmPNY4ndOUgDGP6npt8aVtUICyL5wm9s1LJFZDll26NK7kRaqH1P5mfoYkeQYwAXc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuXWgMnqXb3RYP8YTYWchI3VCC2X9nVHNwvqp66QgQE55kOPND
	h4lGiqgDzmP8uFukdsjfJ+BcAHCntfUfP25l/b6QAXlmUvevL1Jj+shPr8sD0ShdKvWjk/6GHIs
	fzPhUPA==
X-Google-Smtp-Source: AGHT+IF668cUxxhKhGHv90tNvsIeTkhAR6ns6JG1hxt5u/yIlrpHwYKq8uhAaCwc/umnpMOixfg8y4oIB3A=
X-Received: from pjbgk17.prod.google.com ([2002:a17:90b:1191:b0:34c:489a:f4c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2251:b0:33e:30e8:81cb
 with SMTP id 98e67ed59e1d1-34f68b65ff0mr15047069a91.13.1768239588965; Mon, 12
 Jan 2026 09:39:48 -0800 (PST)
Date: Mon, 12 Jan 2026 09:38:38 -0800
In-Reply-To: <20251205232655.445294-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251205232655.445294-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <176823927133.1374677.16641795988105461817.b4-ty@google.com>
Subject: Re: [PATCH] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, 05 Dec 2025 15:26:55 -0800, Sean Christopherson wrote:
> Remove KVM's internal pseudo-overlay of kvm_stats_desc, which subtly
> aliases the flexible name[] in the uAPI definition with a fixed-size array
> of the same name.  The unusual embedded structure results in compiler
> warnings due to -Wflex-array-member-not-at-end, and also necessitates an
> extra level of dereferencing in KVM.  To avoid the "overlay", define the
> uAPI structure to have a fixed-size name when building for the kernel.
> 
> [...]

Applied to kvm-x86 generic, thanks!

[1/1] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
      https://github.com/kvm-x86/linux/commit/da142f3d373a

--
https://github.com/kvm-x86/linux/tree/next
