Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A37E13A241
	for <loongarch@lists.linux.dev>; Tue, 23 Jul 2024 02:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721703314; cv=none; b=K9y5IvDl0NLmOPzQN+qYdwndyo0O4Z7qlZ36twj3SOL1ZSTyyEK7arcPiU5dVek5W013BvULvmwHTfl4zs0ZJ9CkpoXrIdXHFNZu8FN7H+/9CCInBjWAJPHFRVGYVhLCjAvQWLJbi9XXmUvH8jL/Xi7SF46E+aVwkmplzXes+5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721703314; c=relaxed/simple;
	bh=r5Lkl9j3yYg2QYkDT2TRuuo/egzDRxDmqxTZO5LurjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ql/leSrvYPPyT+qAWXVxVuRQ+xGn4khEFo4aoco//uv2EwKqRtafgGGKWTNMFRVdVJIY8x7/uL3ink5E/IzIrd8elymwp99FdlJ+EkeBoKwPcTCFVuiXJMGXNxSJdp78Tp6UDRuCZhfkB3a/cEGiF0IMxAvldAYX0NsA8Xk+MuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ow9kfqcZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ow9kfqcZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBE7C4AF12
	for <loongarch@lists.linux.dev>; Tue, 23 Jul 2024 02:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721703313;
	bh=r5Lkl9j3yYg2QYkDT2TRuuo/egzDRxDmqxTZO5LurjE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ow9kfqcZmSumYdrLkrtcndoTHZUPe2tajWdsSU+1mNaXPXi1Pzp+HoFHpxJ1UmrFk
	 JoUN6O5ZqX+LYvqxVCB/7Qu8ScLdHTXwTl6eXuFsSNqOiVmPvuV64Qikw9sq6K2Z1Y
	 V3FoV2P96jGKziDmyVF08fdsUPjAJjcA8OOb5GUXaPLN+0X5u0sAPcDbmUNU6Cyxb7
	 7XAAsXxy1L5ksKYVn+2svSb5ETa6lXAjx37nJOVAmuASpu4SquKr7hrIt/nn8xjsya
	 dwP+YRSR7qWe5zcttyAFdDPpKKUXpI1JXl1UTeO8H5pJTgJiFkSiHLD+29aViW/fLZ
	 c1H8C7Pe7Um0Q==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5a22f09d976so6017208a12.1
        for <loongarch@lists.linux.dev>; Mon, 22 Jul 2024 19:55:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIIE8vb+ktD91VH1WKIcHKVESvq5B6yBgtY7d8DpmB/JPz6zk1VurvQ7kaa8L4uWqyKQLdEiq2cEpl7NqsGfa4s0IMQDW35wMa
X-Gm-Message-State: AOJu0Yw8uALSmZU+pdL1zX8LV5UTMkjnBaysB6N03OcuEUu2wzDWqXIX
	vGz5t09cSNzeunyJ7xD30jZlRAsD94lgHd3Dvu5VLgH/zSNTkPQXXmbidNLXvs7KsIb0aOMPDQF
	T3AGGZixTe7Fu55N6KhYLkmyqQxM=
X-Google-Smtp-Source: AGHT+IGqqU2ONkKWwep0vC+pn7i7fB0FIRv7XrVoM2pXjMr3n2EucMyLpYljZbVnu1O8EX67qlWSob5H9bd4zyAKpxA=
X-Received: by 2002:a50:8706:0:b0:57d:3df:ba2d with SMTP id
 4fb4d7f45d1cf-5a99ca4d46cmr713090a12.2.1721703312488; Mon, 22 Jul 2024
 19:55:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <09A6BAA84F3EF573+20240722102624.293359-1-wangyuli@uniontech.com> <3bf88ffb-c57b-a881-5a7a-78567e048ae2@loongson.cn>
In-Reply-To: <3bf88ffb-c57b-a881-5a7a-78567e048ae2@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 23 Jul 2024 10:55:00 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7N8J-F4FRLZmSY4=uHo2DhG_pB-zMHCeGuSpx22_SGCQ@mail.gmail.com>
Message-ID: <CAAhV-H7N8J-F4FRLZmSY4=uHo2DhG_pB-zMHCeGuSpx22_SGCQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: Loongarch: remove unnecessary definition of KVM_PRIVATE_MEM_SLOTS
To: maobibo <maobibo@loongson.cn>
Cc: WangYuli <wangyuli@uniontech.com>, zhaotianrui@loongson.cn, kernel@xen0n.name, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	pbonzini@redhat.com, chao.p.peng@linux.intel.com, 
	Wentao Guan <guanwentao@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued, thanks.

On Tue, Jul 23, 2024 at 9:30=E2=80=AFAM maobibo <maobibo@loongson.cn> wrote=
:
>
>
>
> On 2024/7/22 =E4=B8=8B=E5=8D=886:26, WangYuli wrote:
> > "KVM_PRIVATE_MEM_SLOTS" is renamed as "KVM_INTERNAL_MEM_SLOTS".
> >
> > KVM_PRIVATE_MEM_SLOTS defaults to zero, so it is not necessary to
> > define it in Loongarch's asm/kvm_host.h.
> >
> > Link: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/=
commit/?id=3Dbdd1c37a315bc50ab14066c4852bc8dcf070451e
> > Link: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/=
commit/?id=3Db075450868dbc0950f0942617f222eeb989cad10
> > Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> > Signed-off-by: WangYuli <wangyuli@uniontech.com>
> > ---
> >   arch/loongarch/include/asm/kvm_host.h | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/inc=
lude/asm/kvm_host.h
> > index fe38f98eeff8..ce3d36a890aa 100644
> > --- a/arch/loongarch/include/asm/kvm_host.h
> > +++ b/arch/loongarch/include/asm/kvm_host.h
> > @@ -26,8 +26,6 @@
> >
> >   #define KVM_MAX_VCPUS                       256
> >   #define KVM_MAX_CPUCFG_REGS         21
> > -/* memory slots that does not exposed to userspace */
> > -#define KVM_PRIVATE_MEM_SLOTS                0
> >
> >   #define KVM_HALT_POLL_NS_DEFAULT    500000
> >   #define KVM_REQ_TLB_FLUSH_GPA               KVM_ARCH_REQ(0)
> >
> Reviewed-by: Bibo Mao <maobibo@loongson.cn>
>
