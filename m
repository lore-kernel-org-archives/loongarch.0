Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4667F255F22
	for <loongarch@lists.linux.dev>; Fri, 24 Oct 2025 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761323623; cv=none; b=JCZAg98PoW9/4sAfd400ws33FOuUbAVj+gel8O0Qp2fwW27yJRAXe3raoH99ADGoMhCqss6pljkWl+huwLiSfqxx1PZSfKEjy+IFqGYXdz7kivJh0Roy+le8xeKSUcORpMZJvXYjpO7xPwJWBQPDFmumnuXA2I1IkpgI3B6pzFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761323623; c=relaxed/simple;
	bh=Z5gHvRc1WODjsQTzSZtHdDP0DGz77od9Vxxo/tfntr0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mp2lh7FTQvoILg6D7RDp85rsk2XwDMUzk4LlTcgl7M0NOnIQs6G75c1tZjnnVCgrTMqNn6aPUdSsdS26K3sbFG5tPlaPAZ43/p3pD/okz+WAfx0MI7CwHqWaJAUDOsx+ntWWiVKsTmR72BAldo4js36dRaYHEYEm9rm8I+2jRwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B+nC9GPx; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B+nC9GPx"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b5535902495so1389567a12.0
        for <loongarch@lists.linux.dev>; Fri, 24 Oct 2025 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761323621; x=1761928421; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmFbq4MgFLvSavBU+dsE5BY6fpPsL4/gR9QPfUGTSHw=;
        b=B+nC9GPxTu2lGUtamBrI+nca0u7j5qzsbla3HzVZsrqn8ADaR0HoZv8OSqgZ6PZAET
         jERZpDQ0hfAFZ71UT/DgnhdF0KGRWpk77ewI0l02zcd30CPgEJSxjp4+e62WkNDKdqH8
         DA41HZFKtFiRMSbE3CiX6Fmz6bcb5Okx/Jd+yfu5Uuc9Uo1XYFk3DAR6+Nesnj1oWL5O
         6L8acAuX0+dIM7xWqQqLb7wGIQ8sTFy0nxntQp/tfdQrzxR8iNxH3Jp+GbnxqqHqjxr4
         DHJ0D8JpXAyWsqLD2PT9moognyRVciuYaQbE1VuSDqxueG/Db8fwiykKQQpKtfJ8CYqt
         frIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761323621; x=1761928421;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XmFbq4MgFLvSavBU+dsE5BY6fpPsL4/gR9QPfUGTSHw=;
        b=e0PqClrh7Ebx76RBKCDmITcInmLxqqydc2x9dz9quuAi0zjEt9CV5KjTKezoOaYz9H
         LREH8yTQtVulgnfBWGTObjDuEXpAzYeUF7dR9YYu9BEFAHR35ul/Ck8TeIRydG6T5TUT
         xm/kyTR38CH6n3ECVvlrfyMh6vgFDK5EY5I6pvRr369edZ64Qe1MsIBQE80ZL4nzeof0
         ty2feJ+BF8Q3XXYq7Db+AT478t88IpcSIw4hhM+P7rolqCut+60A7tL+Rk+nX8zuXu8H
         x16Q72Tfag5LZBJGLmkET4MgSGrdWqWSP2+tdCOXpFQ1X793yoboypUR8hjeg/+wKPgv
         FGzw==
X-Forwarded-Encrypted: i=1; AJvYcCUzS5HsN7+lMjVZmAkh7nJn1ADSPpbq7HGKMwq9iTo30/kzZO3jv4WH/8wC6uzOI97eBMHG3xcphC4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfQpOPAeJu/+UzrLBzDgfglv+Q9Seku0R5GqpJXvhFnFAZhlJc
	uHMC8FMagQdfiRqQ/zpZPT+APY3bklANw0gyxJM7OkA29qLYaDyts3JEW80pz2aAb92o/nvNmCz
	trfOd+A==
X-Google-Smtp-Source: AGHT+IFeKRRbqSfdPI99mHeasG8LL+kiQGTQFDWiy/7cdPCFgXLMLE3NirNFzhTfpVhc/qoTuLXwCz2Ncvs=
X-Received: from pjot2.prod.google.com ([2002:a17:90a:9502:b0:32f:3fab:c9e7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:244b:b0:30f:7840:2c96
 with SMTP id adf61e73a8af0-334a8629ec6mr34771147637.47.1761323620638; Fri, 24
 Oct 2025 09:33:40 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:33:39 -0700
In-Reply-To: <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-14-seanjc@google.com>
 <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
Message-ID: <aPuqYz3ly5a3__mf@google.com>
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025, Binbin Wu wrote:
>=20
>=20
> On 10/17/2025 8:32 AM, Sean Christopherson wrote:
> > Fold tdx_mem_page_record_premap_cnt() into tdx_sept_set_private_spte() =
as
> > providing a one-off helper for effectively three lines of code is at be=
st a
> > wash, and splitting the code makes the comment for smp_rmb()  _extremel=
y_
> > confusing as the comment talks about reading kvm->arch.pre_fault_allowe=
d
> > before kvm_tdx->state, but the immediately visible code does the exact
> > opposite.
> >=20
> > Opportunistically rewrite the comments to more explicitly explain who i=
s
> > checking what, as well as _why_ the ordering matters.
> >=20
> > No functional change intended.
> >=20
> > Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>=20
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
>=20
> One nit below.
>=20
> [...]
> > +	/*
> > +	 * If the TD isn't finalized/runnable, then userspace is initializing
> > +	 * the VM image via KVM_TDX_INIT_MEM_REGION.  Increment the number of
> > +	 * pages that need to be mapped and initialized via TDH.MEM.PAGE.ADD.
> > +	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all mapped pages
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Nit: Is pre-mapped better?

Yeah, updated (and then it gets deleted a few commits later :-) ).
