Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9924779A3
	for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 11:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040795; cv=none; b=SCT2BJar3zfByaBUFFa8RIXmnOeouWJSlmjQjz+/l0Fhvtll3ZmmEbByCRyeEiK8d7tnC+Vfw11qTH2JjRBTdpl6WYf7LdKZ+HG3r5txFyEPYfbM9vM4DGPnvlZ2aU+YcSQAWm4aTF5NLvdZ8Ghz2mihTPmecdDEs+4m9NToPr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040795; c=relaxed/simple;
	bh=+9G8GC05NdLHXF8cStdhp+Ruyt/HZZEYr3s5pM8Whfc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=OAfmts5KQMZhiXJzOVidouSpPCELc8nEdUi8FN3xxhUUucn4CqzauFsd4sJibkeXLVRO+Z27VU1eEcy5eFyxtTNfOohyg8AOvuW3u+zQnprvELWs7uuwL1oFBC5zPTUwF5mGFadKumFpzed0sKkB5U2RarueA4zeFCGfXmtsJJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VB2JOTzg; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VB2JOTzg"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6aca0f482e5so7509920eaf.2
        for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 04:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040785; x=1789645585; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4oV1R7Sem2YZktphiH9OH9k3wSSCyVuVuzldh1QWGuY=;
        b=VB2JOTzgYXxIR/p/+IebzVoFeUsQCI9fAesBKQ/falBZ1OSELHL/i3p1x9NFS3FVJw
         WIyMFz+bu0MbOU+6ZoAibX7B8fQMNzE72DGTbAB1Ju8Cr0n6ExI+kYtvk1NQHVaEwNNb
         78SVmIvc4H87r4LpFktip+Vylv0Pt9n7+/hAD1+5H5porFND/KPf6y/Vgg0kA0WWcTgf
         5Ib5Pyhmk7rrHcE65seAUkL1v/cG8qkFEj2UyE2weCfS9DPhL1CyShaufHy6XpWFx2ch
         T9F2NlaqTmD6FFlDbhwDbOX3fMtXiRnGXgxGKPAN6yIOHK4r2zkzQbd1TDhJicbztBnW
         Oa9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040785; x=1789645585;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4oV1R7Sem2YZktphiH9OH9k3wSSCyVuVuzldh1QWGuY=;
        b=C+aAFwp2X7APA7PdJ7n/ni8vSaxKBydfFvsZ9gUybm6Qp+c1cnV2NFUlGnGvJMlQqG
         6upLjxcLOdCfnv4qfnxeuXCmzgJ5HB0aU2v6opJ5em6vijdmN5fJFcsv9Gst6KEQ0iBi
         oOhtYCOwUR9jX4zKZz+8v7E3fsdHSTnDwbXJDwdPRa+zbqiLc2PfPXleMz+1izYn4ClB
         9pJqv5D5ewY7b9duXWg/Z1d+3z1vpMf2OBMBU+B4oEqcuCxEq4btdlhPAExzbTTFezHo
         W3XT3t4Zf0H8X3sD83HAgOUQXv18suZzkviWHYKHYEy5x4YYQJB2hS2locREdzMfFjnf
         9NVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuqCA7TjVh5RT6bDhI5ZOldWcGJqMIp9wpe4ULkJ2wu653/u07+C/o+0A39HYa7SMaRah2Q3xFf4Y=@lists.linux.dev
X-Gm-Message-State: AFuF++n7IQFv0qyXAkKVb/uIAGKjvIXF6QOupQWwDRelVvQrHxdO9Glf
	5cNaFkvSoXpx8Z48HQsPpF/HjIXntUUPTfZiTvqunyxeHmaYD2v6rD76
X-Gm-Gg: AYBFou0/e/huWcosB4XDUHC+nEE33iDKg1dRR3DbnNv7hJ5TSzbVUD4+GaLBrHpmAfs
	z83ELhLKPvffxC8pQT7iFEF0Rh2gEt9fz4R4x2rXLDLrWpPsv8wiH7pT/NUE2LUs6eZn2X/zp2p
	kRqCubwbiY5mUVsg4EuT2qzpHOTUmV3EOanyBgWeXVXFedybnF8IGfkjx4cIB8NsvAMPTuSBfRe
	6O8TxbwkMDbTAz6uiQc5NX0zsOhPrtt597XP7IJ07o9iQuMYyhHUHia+pY7LOBhVXvlXVdWKxO+
	xsjIFA3tuFrSZa6IyHpF9a12wGIUSfO7Bmssv2SVD/pQ67OYFnDWGRZL+EBIB99zs7uiYD2RVpJ
	KxisXHezYCFJvrCYGNbNFCwDqKk3yRu+mm425mS54kDSi/NCzAj24MlwUUevP8ywD64ekIaFtKL
	RNeqw55nFBrDF2VLEoEoP1ky/UOHnzaHynCGa0Oxf83Zzc2wbBAuHmS7l9+gDHGPn+fhjxsGp2h
	Liw6yixtV5VpU/P32CWna+BmgeuUFYSoa2/32wdbYE4aKks8LWoJZ0=
X-Received: by 2002:a05:6820:180d:b0:6b7:8415:d78f with SMTP id 006d021491bc7-6b78415d8bbmr19129181eaf.58.1789040785360;
        Thu, 10 Sep 2026 04:46:25 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm46857652c88.0.2026.09.10.04.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:46:24 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 17/20] KVM: selftests: Take the memory region type, not memslot, in page allocators
In-Reply-To: <20260902164123.2546762-18-seanjc@google.com>
Date: Thu, 10 Sep 2026 17:10:56 +0530
Message-ID: <33vh1ghj.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-18-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Sean Christopherson <seanjc@google.com> writes:

> Take the memory region type instead of the memslot in all page allocator
> APIs, except for the innermost quad-underscores function.  This will allow
> automatically selecting the minimum GPA based on the allocation type, which
> can't be done using the memslot due to all regions sharing a single memslot
> by default.  PowerPC support will also leverage the type to ensure that
> page table allocations are naturally aligned.
>

yup, PowerPC can leverage this.

> No functional change intended.
>

Sure, even though the callers are changed to pass type instead of slot,
the inner page allocator is moved to pass vm->memslots[type] to
____vm_phy_pages_alloc(). So no functional change.

LGTM.
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

