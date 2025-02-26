Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408012116EC
	for <loongarch@lists.linux.dev>; Wed, 26 Feb 2025 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740561525; cv=none; b=OToBIhPR8FGblZjMcghWc1UHLHHyQZGzWdPQj1hfhrebxD5voI89YMFPYVxhIZnopjiVcCb//q+8dDkpmV4a4DRIiayJCd6tyyY0Gv7tTkYmE4hFyeqn2qO/gLkhFcSVhYY3PSap6YJAVQ8dyp1n9XA9XeghMw3Dg4ZpNHiqaz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740561525; c=relaxed/simple;
	bh=5zEfvEUUsLGTCHX4AwEafQpReN3akvlINVbTahuLpDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3ZVUKP/OoJZz1erlGx+SWTFVkCwzDes+B1qR7uwgTIvLqOM566BQ/4B8BfmG+/jMaxWM4/Mq7lcob37i3W1CKSBNtzLhVhgtjKlHkK3c6pJKW0vcCvMosDTDp4zHMJvQIe8JGkUmEZQitwgCXwaQ0mXAT1nac+WbY87jXf465M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NfFHzAIX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NfFHzAIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740561523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MIbia0vRPyl/EASI4bbBzkpXlN9D9cFmNZ+w8QhjMs=;
	b=NfFHzAIXISkgCm3u6qfcMrCAga246qeMtuEY3V4zFReCSv9Y9mLZuN1YYATNLjvFxXD9h9
	ddHBnlx45mCgqZKt1BUmmmgfMkSbHDLeAF2cu4OgrtRQhbqQsqNpTDjBJtHBa5htorvCtC
	AGCFED36x9lp8nLUoLL8dCVNU1KADtE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-ds_BdGGVMa6Q-T8Prj1w7w-1; Wed, 26 Feb 2025 04:18:39 -0500
X-MC-Unique: ds_BdGGVMa6Q-T8Prj1w7w-1
X-Mimecast-MFC-AGG-ID: ds_BdGGVMa6Q-T8Prj1w7w_1740561518
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38f2f438fb6so7487801f8f.1
        for <loongarch@lists.linux.dev>; Wed, 26 Feb 2025 01:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740561518; x=1741166318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MIbia0vRPyl/EASI4bbBzkpXlN9D9cFmNZ+w8QhjMs=;
        b=DuIhVqBRGuH89bdWbELuic1WqQPNxUMChhc2nGQYUHM8q4zZL1uKoHBOzQhawVDEiz
         RllSZmjTGJd0P6o5Feny20xm57NkNZj45hbmbDkQb0gGiX1Z+68cwFSJmkhGl3rYcSTC
         FBBWvIL5AILanr8EtwvlkrN//x8SH6fSUKmm2VQvLaS4Icg3hwhfSg8aH6yGMR9BTJ9p
         Lm3b1s2h3N2KXMw1CkLfkhAa6GqL+0zyDLxU9BJ/i7Z8cE2wxGFkBN/YTD9d7RCya1Qd
         HMx+9U5M6rdzgfKv1YIBh+bT48yZ3RnXfhxwbVlot3NKIPlI2rfXIhEcxLMZuxPYJDBR
         BvQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQqRqbyEIiyp6EziZrLyxUNfDtG2qnlXSHmLnDYiFl65UuHRxQGV1kW9mgazF6LccXSBRaoP0ytuc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVJdP9yhIldVDBe29LT4NaabpOSEz+PlKWRPjA3Y2s8ZICzt7a
	pw5CITyNVuJoj6oz+zAod/6rvYuipAfwiJFtP1DDj7Yk14VK0NGLzxlCA0BuTl8zXEukql1qiWi
	KHIfUXL1d7JybLu/AlSm5iwbN0xZFu+m8u91SGoOMNjkYnjKXf8YvzgsxPnG4kiMenU/Sz0aZuY
	Bu9jjjuiajihCSpTxZZQoezyx68dBux5Nt
X-Gm-Gg: ASbGncupPp9h3DsvUbZfbYD8odrBXMxTq2wha1cP0eejd70rZLRJyk3LdKJ0BSK8pkk
	qGWKGsFAvshCuzZwtpBDT/3ED6ZhSqSAB/WWnUKnp1T7JJEWN/MNt4TH5x5DWCbdWLj0TXh+9Yw
	==
X-Received: by 2002:a5d:47af:0:b0:390:d61c:c777 with SMTP id ffacd0b85a97d-390d61cc85fmr1296771f8f.46.1740561517834;
        Wed, 26 Feb 2025 01:18:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM8QJcltKK3icbvaiTIyjEom27+uMjjmS3V6slM8kbmQaHs57lufLQIp1ODz/r9AND77qyPMNyl+BQOe7Hd40=
X-Received: by 2002:a5d:47af:0:b0:390:d61c:c777 with SMTP id
 ffacd0b85a97d-390d61cc85fmr1296733f8f.46.1740561517436; Wed, 26 Feb 2025
 01:18:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-2-seanjc@google.com>
 <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com> <Z75f9GuA9NfKo37c@google.com>
In-Reply-To: <Z75f9GuA9NfKo37c@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 26 Feb 2025 10:18:26 +0100
X-Gm-Features: AQ5f1JqpfKleIgYhNDBuhYOTkE7mUvo6hlKxjC4ts72PAS8Q4WmxhhjJCWdlkGA
Message-ID: <CABgObfZWqBm089dkOpWwX-d6Bgp84zP_0Gow4ow7ZKHov=8oxg@mail.gmail.com>
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Aaron Lewis <aaronlewis@google.com>, 
	Jim Mattson <jmattson@google.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N7vZalK9uH-bu83_MGLb-Tl3oAKDoUinAcycGRy604Q_1740561518
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 1:27=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Feb 26, 2025, Paolo Bonzini wrote:
> > On 2/25/25 00:55, Sean Christopherson wrote:
> > > Free vCPUs before freeing any VM state, as both SVM and VMX may acces=
s
> > > VM state when "freeing" a vCPU that is currently "in" L2, i.e. that n=
eeds
> > > to be kicked out of nested guest mode.
> > >
> > > Commit 6fcee03df6a1 ("KVM: x86: avoid loading a vCPU after .vm_destro=
y was
> > > called") partially fixed the issue, but for unknown reasons only move=
d the
> > > MMU unloading before VM destruction.  Complete the change, and free a=
ll
> > > vCPU state prior to destroying VM state, as nVMX accesses even more s=
tate
> > > than nSVM.
> >
> > I applied this to kvm-coco-queue, I will place it in kvm/master too unl=
ess
> > you shout.
>
> Depends on what "this" is :-)
>
> My plan/hope is to land patches 1 and 2 in 6.14, i.e. in kvm/master

I meant only 1, but if you want to have 2 as well then that's fine too.

As to kvm-coco-queue, based on Yan's reply I have 1 (of course), 4 and
an extra patch to move kvm_x86_call(vm_destroy) at the very end of
kvm_arch_destroy_vm; I'll post everything as soon as I finish building
and testing.

Paolo

> rest are firmly 6.15 IMO.  And based on Yan's feedback, I'm planning on a=
dding a
> few more cleanups (though I think they're fully additive, i.e. can go on =
top).
>

