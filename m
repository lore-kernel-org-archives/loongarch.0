Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C65325495
	for <loongarch@lists.linux.dev>; Tue, 18 Aug 2026 11:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787051552; cv=none; b=KOq/2N2VsufeZtDb310buwtsfRsu8/PTugUQ8EvH2XREfqkFEuLmZSWRXLvmOAzOJSMUJujVrK3+u8+ffa1XbEJ9dQZloh+qYjvyg7ABczAjTgnVyA7AwMeRj0ZoHBQI6HzSbYEiK/KKBistvYmZjsnugi395atWbq+qDK7zL9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787051552; c=relaxed/simple;
	bh=pjGyd28tgFr6I3kKT/1PghjrVtzMwTs6sWpJtRvgfV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p526lh75xefsdRWixa1bYiUGx9NETvUY8815FGarEAxlE2XF4OKTFsVKPiEJOT7SM7M9Q7NLEqC0XIGiS2jWvaLVE7pvdGNlWr+5oXwL3I3OfLKqpjV/7gIw0+70DabMTCVb6MCZMemeIVT3eum7IwgzkfvsL9auFquh2+GAbzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uj7gjEVB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uj7gjEVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787051549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zjOYyVQjkyKYRzWlNzvKguN/v4vYVgXA8EJUgP+Bibs=;
	b=Uj7gjEVBdwIyjyAaO+ttHiAyjyjIXwuSszlx7EBW+hwjzGFCV3O5NpvNssTwJE+Nm7+74B
	JyUwIH/K5aRPKiE6IvsKe8Qht4gUCQTWjed4jQucwqzKRGw0YnmxM3VbIu8UMiC2JM7fzw
	OCO68s4IBZt8ZjxUPveJmvObAVZYoWo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-B80ackbOPyy927oFn-l0Rw-1; Tue, 18 Aug 2026 07:12:28 -0400
X-MC-Unique: B80ackbOPyy927oFn-l0Rw-1
X-Mimecast-MFC-AGG-ID: B80ackbOPyy927oFn-l0Rw_1787051547
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4957287363bso26882555e9.0
        for <loongarch@lists.linux.dev>; Tue, 18 Aug 2026 04:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787051547; x=1787656347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjOYyVQjkyKYRzWlNzvKguN/v4vYVgXA8EJUgP+Bibs=;
        b=ZxAqXKJL0c1pD62NR+OFFnFfCyQQKrNK63ZEli6jCAy+iHk/96qu30rqlYt4aCtu7t
         qbqE5+aJa2HZOcMmJtKKK0AAV9/1KnC92Uo2AtVC8jasF65zBQnEGD8wtOEwJIH+YXyN
         Kbk45wFlS/+b58UwUNmYC3EZDzZJB9XIVyNl2W1T5a21XoK6IME8QZSLiQjG37GO38ZB
         4VaQKJotC1JITG98s5TahQZHIaffuttMxNIc1WabMNQwheFPkvZGO5jlU/aYtnvLRD3x
         NXlPMl0Mu+08ywZC9JJQ+hZUVtCEkhSCwBMQ6NJOORAlIE1qxEj1HY/7DfCqPIDEIEjC
         l//g==
X-Forwarded-Encrypted: i=1; AHgh+RocPCyOcD8sWIjiFW+seJYGnjXtrn6IjKg1LZrx7a78UEGMBYI5EVUfXoNBHH2XYg2OtmGgvSVZlEA=@lists.linux.dev
X-Gm-Message-State: AOJu0YycOrdHxm/jXCY1/2mZIwNQrdeDxsRWk5dAxvYqQqD7A5ULoEzl
	I4W90IVWXDhBcA29p1lnXt9zYsGy1+f5NuRvkjzuGcCQf61URdqVXVEqVt6l3KCRI7dkoxGXm0W
	3vK9qVSux6a8ZPOar0n1bYX7pUkXd7MnjW4MfgSO/g+iwph7tgqLf9owiIPPh2alrNwI1jcAvFU
	22d38vZtwGe+M8Y1mwkskhfRZTtlYTChLXVESV
X-Gm-Gg: AR+sD12bwTsbGY9qr3CVH8ItbfqXag3NKKtvRrP7emx8dERf0d7MpEZ8H4Toh3yrzFY
	aBDf2uuBShjKoA0WqZiFF6R0AjjDYcYKq7rKWh1fjcQN/gi0SuA8n2TDhwi/MLCkdiBdJO+ONPF
	K29u44cn4xaUhgdlHtJt0AQHr+2Op8MgOoMJYlNS26rRytOuo6Uuw6Xxc8ZYbkaSirjxwAsuE6T
	75HJCMKkvE0WmIMS2TyIBmtf502x2GIPiNUpuKSdlywmrpSLb1DEKGuV7w=
X-Received: by 2002:a05:600c:3f06:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-49987961c32mr536824845e9.9.1787051547131;
        Tue, 18 Aug 2026 04:12:27 -0700 (PDT)
X-Received: by 2002:a05:600c:3f06:b0:499:484a:81d0 with SMTP id
 5b1f17b1804b1-49987961c32mr536824235e9.9.1787051546760; Tue, 18 Aug 2026
 04:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813120829.823203-1-chenhuacai@loongson.cn>
In-Reply-To: <20260813120829.823203-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 18 Aug 2026 13:12:14 +0200
X-Gm-Features: AcwNN1WJL9DCYlzOykUxmNciccKYc8fmPASDT53jdKrBVMbmWn0FeKifCQ_Yxrs
Message-ID: <CABgObfYdTy+EPt4JSatYCKUnDwmvqNF-JYWH3rJeqJz4gK3NgA@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v7.3
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QK9AqJGOOwrC0_41aKLZ_tLwNJ5D2gNuq6oSNpW2_2c_1787051547
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 2:11=E2=80=AFPM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> The following changes since commit db2ddb87143519e20a95aa36c60b36107b736a=
58:
>
>   Linux 7.2-rc7 (2026-08-09 14:54:50 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git tags/loongarch-kvm-7.3
>
> for you to fetch changes up to c5959723aaae06aa617253528e6b228b3c858215:
>
>   KVM: LoongArch: selftests: Add FPU/LSX/LASX test cases (2026-08-10 12:2=
1:58 +0800)

Pulled, thanks.

Paolo

> ----------------------------------------------------------------
> LoongArch KVM changes for v7.3
>
> 1. Advertise already-supported capabilities.
> 2. Some bug fixes about timer and MMIO.
> 3. Some hardening about interrupt injection.
> 4. Replace kvm_err() with kvm_pr_unimpl().
> 5. Add FPU/LSX/LASX test cases for selftests.
>
> ----------------------------------------------------------------
> Bibo Mao (8):
>       LoongArch: KVM: Set vcpu->cpu before IN_GUEST_MODE is set
>       LoongArch: KVM: Set default MAILBOX access size with 8
>       LoongArch: KVM: Return directly when IPI address is not aligned
>       LoongArch: KVM: Fix uninitialized stack variable issue with dmsintc
>       LoongArch: KVM: Use internal API to deliver interrupt in kernel mod=
e
>       LoongArch: KVM: Replace kvm_err() with kvm_pr_unimpl()
>       KVM: LoongArch: selftests: Enable LSX/LASX by auto detection
>       KVM: LoongArch: selftests: Add FPU/LSX/LASX test cases
>
> Tao Cui (3):
>       LoongArch: KVM: Advertise already-supported capabilities
>       LoongArch: KVM: Reload one-shot TVAL on migration destination
>       LoongArch: KVM: Prevent division by zero in periodic timer restore
>
> Zeng Chi (1):
>       LoongArch: KVM: Fix PC double advance in kernel MMIO read fast path
>
>  arch/loongarch/kvm/exit.c                          |  19 ++-
>  arch/loongarch/kvm/intc/dmsintc.c                  |  18 +--
>  arch/loongarch/kvm/intc/eiointc.c                  |  32 ++---
>  arch/loongarch/kvm/intc/ipi.c                      |  77 ++++++------
>  arch/loongarch/kvm/intc/pch_pic.c                  |  12 +-
>  arch/loongarch/kvm/timer.c                         |  14 +++
>  arch/loongarch/kvm/vcpu.c                          |   7 +-
>  arch/loongarch/kvm/vm.c                            |   4 +
>  tools/testing/selftests/kvm/Makefile.kvm           |   3 +-
>  .../selftests/kvm/include/loongarch/processor.h    |  18 +++
>  .../selftests/kvm/lib/loongarch/processor.c        |  11 +-
>  tools/testing/selftests/kvm/loongarch/fpu_test.c   | 137 +++++++++++++++=
++++++
>  12 files changed, 269 insertions(+), 83 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/loongarch/fpu_test.c
>

