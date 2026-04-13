Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281A42BEC2B
	for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776073609; cv=none; b=UuKTPyBY8kC69EuqwvPwIAXnozfwDQNoud/5fsz1g4j8J2mMuTFL5CoBBXnquME15CL7L93Up6vy3O7iQ0Wj8r9YwYvk69NE5Y9iCzYO62rsnsYXqRs7cB2Z6tyc8wvBp80RnDFJ5rnA1F4q3xgcyiTvN8XXo1Ja5wy61KlEur8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776073609; c=relaxed/simple;
	bh=6Kvd5k21t20YtvqeCZelB9p2q5tUgS1BCP/iDrVjDPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=frg+9VcOymJ6y5xRZzuHCFO7SHmfdobACYx/fJEWx5hEcc6k6mcQMCWkChxTObZyXX7jNbQ4PzorWrAkVWKIyIScmlYHPsGBi7JIN69viAJHKe5PmbmUVx8HUvOfB8Y7vuy3gZ4ThcpjsA5BIySwGSkw0g37tn3SyRDPWms7VMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DuIpNUfW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DuIpNUfW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776073607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pqOOpFXr472jplXX81IjB0fG69DkhTvRYkUZqOIVbjg=;
	b=DuIpNUfWMt96E/RP76APnXWTaLHK7Mlej+qMJtiAT/+yW8BTyervBBNIjdZBg9QPJC/GMS
	Tdjgo5+oohvAxc6U9OJufvU6J3ZCIWfFdSbLX6NWt+U9m20SRoNZSe08eRjoILLIlNy1Sk
	VnpeoZAeW19ihr98JM4YkQfVH59+Sac=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-jjgK4W-lO0GPeGbp0LHWeg-1; Mon, 13 Apr 2026 05:46:45 -0400
X-MC-Unique: jjgK4W-lO0GPeGbp0LHWeg-1
X-Mimecast-MFC-AGG-ID: jjgK4W-lO0GPeGbp0LHWeg_1776073605
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d780757eeso541847f8f.1
        for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 02:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776073605; x=1776678405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pqOOpFXr472jplXX81IjB0fG69DkhTvRYkUZqOIVbjg=;
        b=JZ0DmT4Zrm/zlyK0BXrR025J/4ajHQmGHCgRcWjp+Lnn4mTdf9ZtTHr5G0zJYd7K1i
         Skp4PQjh5gJfV0bltSWOPQMJsJxgeVq5UYzRTqx9SOU386qjQ6zv5EQ+eBmMwSsfmzYv
         R52x86ciGjbR5shvgJOl+FhrCJmjcRzHGW9ca2pYN99MerW7Z+8RCpt750QKYmpLffLg
         JUUq51oMAeFy2osRIHjb7pnKfeJvtzA7Q3VI89FVvp0v2IeGbKsvb4tlp6xyURSUzKwA
         6AwuS4wEOCXYQr83lD1bMOE5l8/LOaMrDAK2AysPWc2LAm2Z3B8MCLwoGfdsgp8OJVvE
         mUhA==
X-Forwarded-Encrypted: i=1; AFNElJ/pFR3v9psFxAMTBGSQ9t0+hcZPuOGINEpw2IvTeUewe47iN5eV1l25jtlkVc/qvz7A3U4sShJidqY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/wkN6R6vWHg2q0TfHW0IYscOKUz752s7Yt324SWJtfDB2VD1x
	ElbmNBLH5+rSdN2FGmjfzcLjbT5OvoIgTefIGmt/T2ZZ5PkP3Nl/o8J65xeiBjlcqe2tu72haY/
	PHhX4Dh8YJD8Vz6lm5M7VmV5dZ3jlQ5ceSMcIE65pZUb/eA0JtXE8n8xxHW3Vp/E4Q0ssYn44Z6
	+B81eay0l5UwEJwH4+PFVTb9bNcIuB0JMtLlkm
X-Gm-Gg: AeBDietGPCCAqR1fDIaSnrwFNQkQwCDygjJJHEpU68BQbRk3/43uLpbIA3WXQxdGvn8
	02PoJzJDck+pOKV1gjayU3eh0PTXRpoNFkLDtf5PawhYN8iq1aWeYhT1yl1kUYQDUdh61NTgtN0
	sU4j+R1C5Ll6heH6Mx0/UqM/chpgtpH8s1QzRNmGNRRLcFn3lgH2XXpUPRGbCuAce8ChNzvUPNA
	8kzW4XtcVLsPegu+TZVJdmSIruAmARNRnekbJw/ybXtMZxcepjDuPVHzc5Wp+XDM9+WR+J3rc5/
	0v7n
X-Received: by 2002:a05:6000:178b:b0:43d:78ae:b785 with SMTP id ffacd0b85a97d-43d78aeba0emr4286956f8f.21.1776073604608;
        Mon, 13 Apr 2026 02:46:44 -0700 (PDT)
X-Received: by 2002:a05:6000:178b:b0:43d:78ae:b785 with SMTP id
 ffacd0b85a97d-43d78aeba0emr4286905f8f.21.1776073604121; Mon, 13 Apr 2026
 02:46:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410102245.2749691-1-chenhuacai@loongson.cn>
In-Reply-To: <20260410102245.2749691-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 13 Apr 2026 11:46:31 +0200
X-Gm-Features: AQROBzBCxZ_O2q5gvgr11sGkXKrARbdo_rIJ09vTpuizMA__mmpaLs_IJqSTAh8
Message-ID: <CABgObfapzrFmCndV1HVk02rvTwvx4n1WvQ4AW0cySV6mZvWF7w@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v7.1
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p0edzigahXWvUA6NqsE9R6vj2RvZzG1KXqw3T46kPRM_1776073605
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 12:23=E2=80=AFPM Huacai Chen <chenhuacai@loongson.c=
n> wrote:
>
> The following changes since commit 591cd656a1bf5ea94a222af5ef2ee76df029c1=
d2:
>
>   Linux 7.0-rc7 (2026-04-05 15:26:23 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git tags/loongarch-kvm-7.1
>
> for you to fetch changes up to e47b8e1db9a9bbef6765e85b11e87f48e6b56846:
>
>   KVM: LoongArch: selftests: Add PMU overflow interrupt test (2026-04-09 =
18:56:38 +0800)
>
> ----------------------------------------------------------------
> LoongArch KVM changes for v7.1
>
> 1. Use CSR_CRMD_PLV in kvm_arch_vcpu_in_kernel().
> 2. Let vcpu_is_preempted() a macro & some enhanments.
> 3. Add DMSINTC irqchip in kernel support.
> 4. Add KVM PMU test cases for tools/selftests.

Pulled, thanks.

Paolo

> ----------------------------------------------------------------
> Bibo Mao (4):
>       LoongArch: KVM: Check kvm_request_pending() in kvm_late_check_reque=
sts()
>       LoongArch: KVM: Move host CSR_EENTRY save and restore in context sw=
itch
>       LoongArch: KVM: Move host CSR_GSTAT save and restore in context swi=
tch
>       LoongArch: KVM: Make vcpu_is_preempted() as a macro rather than fun=
ction
>
> Song Gao (5):
>       LoongArch: KVM: Add DMSINTC device support
>       LoongArch: KVM: Add DMSINTC inject msi to vCPU
>       KVM: LoongArch: selftests: Add cpucfg read/write helpers
>       KVM: LoongArch: selftests: Add basic PMU event counting test
>       KVM: LoongArch: selftests: Add PMU overflow interrupt test
>
> Tao Cui (1):
>       LoongArch: KVM: Use CSR_CRMD_PLV in kvm_arch_vcpu_in_kernel()
>
>  arch/loongarch/include/asm/kvm_dmsintc.h           |  27 +++
>  arch/loongarch/include/asm/kvm_host.h              |   3 +
>  arch/loongarch/include/asm/kvm_pch_pic.h           |   3 +-
>  arch/loongarch/include/asm/qspinlock.h             |  26 ++-
>  arch/loongarch/include/uapi/asm/kvm.h              |   4 +
>  arch/loongarch/kernel/paravirt.c                   |  16 +-
>  arch/loongarch/kvm/Makefile                        |   1 +
>  arch/loongarch/kvm/intc/dmsintc.c                  | 182 +++++++++++++++=
+++
>  arch/loongarch/kvm/intc/pch_pic.c                  |  15 +-
>  arch/loongarch/kvm/interrupt.c                     |   2 +
>  arch/loongarch/kvm/irqfd.c                         |  10 +-
>  arch/loongarch/kvm/main.c                          |  14 +-
>  arch/loongarch/kvm/vcpu.c                          |  29 +--
>  include/uapi/linux/kvm.h                           |   2 +
>  tools/testing/selftests/kvm/Makefile.kvm           |   3 +-
>  .../testing/selftests/kvm/include/loongarch/pmu.h  |  66 +++++++
>  .../selftests/kvm/include/loongarch/processor.h    |  15 ++
>  .../selftests/kvm/lib/loongarch/processor.c        |  15 +-
>  tools/testing/selftests/kvm/loongarch/pmu_test.c   | 205 +++++++++++++++=
++++++
>  19 files changed, 593 insertions(+), 45 deletions(-)
>  create mode 100644 arch/loongarch/include/asm/kvm_dmsintc.h
>  create mode 100644 arch/loongarch/kvm/intc/dmsintc.c
>  create mode 100644 tools/testing/selftests/kvm/include/loongarch/pmu.h
>  create mode 100644 tools/testing/selftests/kvm/loongarch/pmu_test.c
>

