Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8939C1CF5C1
	for <loongarch@lists.linux.dev>; Sat, 14 Sep 2024 13:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726320858; cv=none; b=Ip16cXQFx1CG1I2IbkafUw3zC1zNTEBQEEhMETFG2wBQsC7iavSH+Ui1P0IWQqH5WCLXDgbaouASFin72QDf/VeneGEHnYjJS6sMH+L9N80AXeKkWD0JpH93NOREg/IYrhbKTxZ1aIcOGlWmcGYHG/qD/eyQghxnPTqPmQue8xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726320858; c=relaxed/simple;
	bh=Bo9HHMH/7VGecfGqlAkHXUQ0PAaQ8egvSPQACg+ewKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTmBIzihcUNRxw7LZLcE0ME0WxVm+689hi1rSJxXUsVah5nfQUwrxNKjxovUrhyaTji2vv75fK6cshAW6VCkNjyvZVwrumgy5+l29OdX1PLTkzP0jqkAyadxVg/6mihWLutK2qR7V0lxT9Gn3YXa1vlo4sZkixbO+IxkVN3bkOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CdDCwxPb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CdDCwxPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726320855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=INwlJ0XvfL4HQTe5EqAskgvpw/m/mm4hcWt9RMaUHIY=;
	b=CdDCwxPbLKYGPZIGTct2pQd/MIGxXvpzMEZx68qFOr5T87asYDGVZNmWVG41WG/soNhrJo
	pGFLsvBHOLXO4a0yNiLHOvcAMzNxfDAYUnTOdxADwY3hqWLJ2w/8kxu65G9ri6rBo3XMnm
	8Gl6efNE6Uqo1A/PArleHfSf9vkYvKU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-a_4sOvZBOJCrTIInxMPgNA-1; Sat, 14 Sep 2024 09:34:12 -0400
X-MC-Unique: a_4sOvZBOJCrTIInxMPgNA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-374bfc57e2aso1753814f8f.3
        for <loongarch@lists.linux.dev>; Sat, 14 Sep 2024 06:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726320851; x=1726925651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INwlJ0XvfL4HQTe5EqAskgvpw/m/mm4hcWt9RMaUHIY=;
        b=Jizu9o7NNntBzj3vyvDEZwf7nfxhj5shfkYLa710GJlTETczRTKhM/JP2/cYp2Qlbe
         Fb6SMm8Ue7GEcD9+3zMsNtI3LKj5Fd9veSQ+jmy8Ctcbh9klxQk4WgW15NA/Fmm0r/eo
         Rs9IZ6LNVO+uy9dQ+OaFm6Nujnqb8mCpbhXUCu3hUJG9xSqG3hrDh9zfcK0NnrKCiQQJ
         80G7rRfjarnhVoVK5PC56AGBWfodHR9MXE2jYkACNWE3wHAtymhKTVk48zzWTnBcuj02
         JN9CD9Q/GQiVqZUghcgzWJ+RG2ohTxR8Vuvgvd8WeeLzA0vPtDdsrkqsJw+4wdRLaXvI
         NRpw==
X-Forwarded-Encrypted: i=1; AJvYcCWsJytfgbqIjY12DdvqIMy24knkd+DdlJfERP+iHB20Gg72I/g96oMCce59xpoB/4Bjla4YhG5bsEE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8gZvYei/rZK7JqHDXz48zbnFdohBa/xA/TsJuZNj7w2hzUr5Y
	l40Sup6ql7hVCMzus/zf1v7rIAg+FNUEM4BC9BX7Qss76FKiNn8mzDHN3d0si8sy0FoGA+cnS65
	6fNdNJ3NIJscbafYd2AmIxqHPip42stljqE/1iWImJ4BGfisDgkAMFH5hp6Dv1F/8ZOlg0qR3wH
	hnZbflZzPttGZdC4HI9zaHthRwH90KKuH1ZLpCQC1VY44=
X-Received: by 2002:a5d:50c5:0:b0:374:b35e:ea6c with SMTP id ffacd0b85a97d-378c2d515cemr5395088f8f.40.1726320850956;
        Sat, 14 Sep 2024 06:34:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb6HtPkwGnd8GM7d/KRiyJlB1NATkocV9vkbyr817E3RiHieIGR5imtJW33zVee0ZnqWkWEGQp1XYS+1SQiKY=
X-Received: by 2002:a5d:50c5:0:b0:374:b35e:ea6c with SMTP id
 ffacd0b85a97d-378c2d515cemr5395071f8f.40.1726320850544; Sat, 14 Sep 2024
 06:34:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240913085812.1030686-1-chenhuacai@loongson.cn>
In-Reply-To: <20240913085812.1030686-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 14 Sep 2024 15:33:59 +0200
Message-ID: <CABgObfaNgSX=3RJjksLq+g9qq6r6HO=YgAXRE4UQdPPL0XKifw@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v6.12
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 11:07=E2=80=AFAM Huacai Chen <chenhuacai@loongson.c=
n> wrote:
>
> The following changes since commit da3ea35007d0af457a0afc87e84fddaebc4e0b=
63:
>
>   Linux 6.11-rc7 (2024-09-08 14:50:28 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git tags/loongarch-kvm-6.12
>
> for you to fetch changes up to 3abb708ec0be25da16a1ee9f1ab5cbc93f3256f3:
>
>   LoongArch: KVM: Implement function kvm_para_has_feature() (2024-09-12 2=
2:56:14 +0800)

Pulled, thanks.

Paolo

> ----------------------------------------------------------------
> LoongArch KVM changes for v6.12
>
> 1. Revert qspinlock to test-and-set simple lock on VM.
> 2. Add Loongson Binary Translation extension support.
> 3. Add PMU support for guest.
> 4. Enable paravirt feature control from VMM.
> 5. Implement function kvm_para_has_feature().
>
> ----------------------------------------------------------------
> Bibo Mao (6):
>       LoongArch: Revert qspinlock to test-and-set simple lock on VM
>       LoongArch: KVM: Add VM feature detection function
>       LoongArch: KVM: Add Binary Translation extension support
>       LoongArch: KVM: Add vm migration support for LBT registers
>       LoongArch: KVM: Enable paravirt feature control from VMM
>       LoongArch: KVM: Implement function kvm_para_has_feature()
>
> Song Gao (1):
>       LoongArch: KVM: Add PMU support for guest
>
>  arch/loongarch/include/asm/Kbuild          |   1 -
>  arch/loongarch/include/asm/kvm_csr.h       |   6 +
>  arch/loongarch/include/asm/kvm_host.h      |  37 +++-
>  arch/loongarch/include/asm/kvm_para.h      |  12 +
>  arch/loongarch/include/asm/kvm_vcpu.h      |  11 +
>  arch/loongarch/include/asm/loongarch.h     |  11 +-
>  arch/loongarch/include/asm/paravirt.h      |   7 +
>  arch/loongarch/include/asm/qspinlock.h     |  41 ++++
>  arch/loongarch/include/uapi/asm/Kbuild     |   2 -
>  arch/loongarch/include/uapi/asm/kvm.h      |  20 ++
>  arch/loongarch/include/uapi/asm/kvm_para.h |  21 ++
>  arch/loongarch/kernel/paravirt.c           |  47 ++--
>  arch/loongarch/kernel/setup.c              |   2 +
>  arch/loongarch/kernel/smp.c                |   4 +-
>  arch/loongarch/kvm/exit.c                  |  46 ++--
>  arch/loongarch/kvm/vcpu.c                  | 340 +++++++++++++++++++++++=
+++++-
>  arch/loongarch/kvm/vm.c                    |  69 +++++-
>  17 files changed, 616 insertions(+), 61 deletions(-)
>  create mode 100644 arch/loongarch/include/asm/qspinlock.h
>  create mode 100644 arch/loongarch/include/uapi/asm/kvm_para.h
>

