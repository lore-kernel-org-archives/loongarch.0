Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCE93ADBB4
	for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038590; cv=none; b=VLOQViU1756JyBJWJEXtI0fNgNPFaY0SRacA233gvmohin6aWBTLDVp0NOAJQQJfnzLlr4dSo6uAqfgL2n73pok3xCXR2YrSdTpxzm89/wxY66DVHQ4rneJWlgFstjY+68e/66W5W/mA/pxgGPpKjytI8/JvBWuyxLfd0ii1gjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038590; c=relaxed/simple;
	bh=Eo81uOdJ+VH0txQFT7CDWDmJC3Wu6IIZvi7ALvkgXzU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=H2UtLSaeVCjUFyf6wyeLPWwhXLjGisMWWqQIxPf2VJ4wwi/P+W0Aas9RSxTbyRTeG3pahZgx7eTzE8plJQ+9lZnHlojLZ7So2FNzG2xztzI7/tdlGIN40HUo2+hSq5TIwXCkdiC5tcqPIomP+bnA7C1K6ULfDNbpom3d/M1mfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkJD0N/p; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkJD0N/p"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4bdf8acd6so245421a12.1
        for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 04:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038588; x=1789643388; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8QbTTWk563brFKzUulM5hzJdIlUHhbe3RJ1vb+Th/iE=;
        b=nkJD0N/p/HH7QeqkklYrLD4QRtpTZHh3GjZF6nPNbjktZ6dcDhH4K9RP62MI6NUlbg
         GOOimYMpHD4KKrVmil1NrTVIeQr3NqYhIdNsdojtR5Y7uaiJFyefV3Y9IkuQAyxahHNO
         N21RLC2bSA9tCgZ0tLGjTUXP8F9/diD5RGNBVzAJ2dgGez5rATqk2GTN3YsE/+H94HF6
         2Nkt/angchDyfYkCqqeOxG//VsRcK2+8jqCYb/916a3+LWlCu7taiOUwOA6Yjp9+weys
         TZCj0vv/6Bzw62+IXQTvUSrVF4+nAdWy16bllT18H1SOlCJYOgColCBVEzXwxIU+hVYy
         c6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038588; x=1789643388;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8QbTTWk563brFKzUulM5hzJdIlUHhbe3RJ1vb+Th/iE=;
        b=Sz66qqNXtSZ8GJ1EYmvCsXaSOliXqkZxuUQGQnVizyJKpgByjs8WrDbp7Ogr1vTpnK
         /1I71uAr28yNvAM8dMY+4zxDbVxT1eOkXWvzoUlZYwrM2quT5kpbnjUbkQ3OtYA5UaKw
         3BBdIs/EwhNH3Ndq7SC+KWmcsNBwQj7SF5X+Dny4lEaYwktOXsWVb1Qw2Q3893FE24OJ
         f7c/OnAlot0oJ0AZxxsXsitoqAJ1jmgZCbodyvVx4j5SaHJGSJjQUJ+wfY+bRQ2IbKEc
         ZtBk2VTemkn85bWbuGLl8RXKT3EZLPSawIFzFAOZJwLXRU/SgamvNFKBerxFnXwkYHeZ
         aFOw==
X-Forwarded-Encrypted: i=1; AKwUvBzqHuVblyXj15SErJbipJ/KkoB/2j7s3AU6OqAaEwGel8fsa4UWkSOTzWWPn+FtAdH0aCS4ZQNOx6Y=@lists.linux.dev
X-Gm-Message-State: AFuF++n50N3LJovg/N5Lsfq1NDY9O/R3e5ShDccROPCvwsCHknkfRMIP
	+Smotf5kpe8ZQWGMnPn/ZjZI13toN/m2RLvkKydIu52haXfmfuhVm4a0
X-Gm-Gg: AYBFou3L5g5iYy5qQm19B7Wonh3qxOAWrsC69iBEL3KFtIRl03FfYG29OgKuHSkDsWF
	JtMqSQlLmQpvlMOJOfMU2K5wphsuT3yFsx4l/DlRTUh67Cvi58pcj+NzS+RjAhVPS7GKyMBZtHd
	RBNNzavyxYqqSQvwflakbONfIvY7pkTjY712A2oWTjpmhSElUeVWAI4sJFqJUtvHe2oCto4U945
	MZMyBGMOst96dlc/S+sazonZaZRkWxJJFGN3HH1GS74piJB6d2A7gcrZMHJNMb983fF71xEAxHR
	QOdK7icAbPWbc5sx7mYaFDfqtlJVXR3Y0oIVLJi/yU9knQRyme3mL5celXL0T2if/VsXLdQNEtd
	GekKVVVt1JfECujQKyjQayheQlZ1CoexflUU0Cw41n36XmM/sZmzCh8eivrd9PBirzuTYEWxPDW
	+GDJDMORMif9xnu8/ih+HrgyLwlxMvLkh9MP+mseXh45MhvupQu9vApB/4bJWMA03GCscW0X5J/
	5zaNg7Tt+Ftecpo1bWnGGXD16F6ROsJWOQNEaE/JH6+E0ZVtNK8hBw=
X-Received: by 2002:a17:90a:ec8b:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39d70bb1bd0mr11082578a91.19.1789038588475;
        Thu, 10 Sep 2026 04:09:48 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm68881202c88.2.2026.09.10.04.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:09:47 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 11/20] KVM: selftests: Initialize vm->memslots[] with invalid memslots during creation
In-Reply-To: <20260902164123.2546762-12-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:39:02 +0530
Message-ID: <7bkt1hyp.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-12-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Sean Christopherson <seanjc@google.com> writes:

> Initialize vm->memslots[] with an invalid memslots value during very
> initial VM creation so that failure to configure the core memory regions
> generates an immediate assert instead of potential weirdness, e.g. if slot0
> is coincidentally valid.  This will also allow hardening the region APIs to
> guard overriding a region's memslot multiple times.
>

Sure. Looks good overall. Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
