Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4611E37649B
	for <loongarch@lists.linux.dev>; Tue, 21 Apr 2026 16:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776789409; cv=none; b=kGFUnY0ngsoGvH6KL/LbjFHtgCObD4hfr8tDsn5iV3vB+aYh+Kw+2k5uZjqtqOdfiQEby/lguRcopr4nfm0IuymLoQottnEolnzYQsDNqjdx+5S8Si5fbMLf3DLQZ3F790KOoB4FpmBzyCrYz5Je03gawUig/UbZ70oPKbDJDtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776789409; c=relaxed/simple;
	bh=RbE0e0q9mMHN0z46/U0LNMsuOexV2rc1KTRhEwi6lkQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AeqqvJ7ZkMa7AbIpsCbkq+5gbm7rCbiENmmtg3flT4e922FFZLqGur63XCgbnAhhppmnE2d9J+fTdDINdzUC2t5D0DPiLSoK3dWj8kwu7LimUXQEiEmPBAqveIllm+2g/jBzUoUQ9d4hUOcHriXXdtQpwSuX6+FFYX8sbx+CQ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qgTmozwF; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qgTmozwF"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so2580013b3a.0
        for <loongarch@lists.linux.dev>; Tue, 21 Apr 2026 09:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776789407; x=1777394207; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wIUrNdIXF/OzM+8I4bF+3IsDchXtCAl73sYtHCgqt6w=;
        b=qgTmozwFlSraZIMCnMQerBV5yu7BPk+Q9wGVX8P//0PAx6OP72eGi+FWt71RoZlXrF
         dGkd8xH9c5Y/PKgiNLBeyJX1TMjZRt/4nXAVvIhMR9RwWo8W+9cQSYGY9ulOJqRh8puo
         Rlj9wWMlGjSsuQiExBVxHKuaxKeyzjhEROsgFapovMI5gMl5LDkALUhrEcdg9tbmaHZX
         JQIp61kXoLTda7rfhLPoRFRf37gRmtMLQIGpD/YNMNgKiOiN+/h/6QKG2xlB/JGPRRv5
         l9QlwmCsEVp+YebjzWOQCp+colYxzcQuvQK/GeRvjgRIIL8JEmS+6O8CO7f2pI0fuy/Q
         Wqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776789407; x=1777394207;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wIUrNdIXF/OzM+8I4bF+3IsDchXtCAl73sYtHCgqt6w=;
        b=beysXw4VsSRy5FUYbIMd3iteadu0x9g6BB2ZEP6euHmoi9bxEe8Pi+GNfgjksp2A3u
         m4Zqo1XBHqgRn3uToWWv6+XASQuNNT6yPSFUTn7UbAQCWDS7QRZ++8mcJ3+Cc4k0OQQ7
         mN7fJYsBjF7gH1X/9XRxhCyiYsQVdbFs2YgauFd6CNfggvyPqxjdV3/BxbcjfjJ8cg5X
         vBipDaCy2c/DEqOQhjdjGZm19qef7uT5jayRyfh0Rsf86uuYRdIh34T2WzlkTAfnyzEN
         EoTBQRpgyofuGMND8+OQEWmljWMZlxsdYNu+J7dC1mpixtpXNatKy7dZTCGLdEinh/OM
         8DyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qa2nSaewzB7Dg8u5IKWxqX/stNWoMdaRw4JGzld0g1M8m3sdPdtP0Yj9uzqajwcvdrDwwRuOzibc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEejxYP8Wj6zcRT0cFAyBMnH/PmRsUK1cdCWm+wyoQNcEHzHXo
	RHwHUzGsjPCxyRWYoY76j+vB+AvfIpB6UBacpRv/OoYqDF/Z2ZRurr7Zc2AqiVkEdHxY8kCwqBy
	6a1rR6Q==
X-Received: from pfde6.prod.google.com ([2002:aa7:8c46:0:b0:82f:20ed:8059])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a247:b0:82c:1cd0:2f7e
 with SMTP id d2e1a72fcca58-82f8b553974mr14884576b3a.20.1776789406330; Tue, 21
 Apr 2026 09:36:46 -0700 (PDT)
Date: Tue, 21 Apr 2026 09:36:45 -0700
In-Reply-To: <aed88qcV6PjEIHnd@lucifer>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260410151746.61150-1-kalyazin@amazon.com> <aed88qcV6PjEIHnd@lucifer>
Message-ID: <aeennZlV60k81OBf@google.com>
Subject: Re: [PATCH v12 00/16] Direct Map Removal Support for guest_memfd
From: Sean Christopherson <seanjc@google.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Nikita Kalyazin <kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"corbet@lwn.net" <corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"will@kernel.org" <will@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "vbabka@kernel.org" <vbabka@kernel.org>, 
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "riel@surriel.com" <riel@surriel.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, 
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"coxu@redhat.com" <coxu@redhat.com>, "ackerleytng@google.com" <ackerleytng@google.com>, 
	"yosry@kernel.org" <yosry@kernel.org>, "ajones@ventanamicro.com" <ajones@ventanamicro.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "tabba@google.com" <tabba@google.com>, 
	"prsampat@amd.com" <prsampat@amd.com>, "wu.fei9@sanechips.com.cn" <wu.fei9@sanechips.com.cn>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, 
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "dev.jain@arm.com" <dev.jain@arm.com>, 
	"gor@linux.ibm.com" <gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"thuth@redhat.com" <thuth@redhat.com>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "urezki@gmail.com" <urezki@gmail.com>, 
	"zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, 
	"gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, 
	"jiayuan.chen@shopee.com" <jiayuan.chen@shopee.com>, "lenb@kernel.org" <lenb@kernel.org>, 
	"pavel@kernel.org" <pavel@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>, 
	"yangyicong@hisilicon.com" <yangyicong@hisilicon.com>, "vannapurve@google.com" <vannapurve@google.com>, 
	"jackmanb@google.com" <jackmanb@google.com>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, 
	Jack Thomson <jackabt@amazon.co.uk>, Takahiro Itazuri <itazur@amazon.co.uk>, 
	Derek Manwaring <derekmn@amazon.com>, Nikita Kalyazin <nikita.kalyazin@linux.dev>
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 21, 2026, Lorenzo Stoakes wrote:
> On Fri, Apr 10, 2026 at 03:17:47PM +0000, Kalyazin, Nikita wrote:
> > From: Nikita Kalyazin <nikita.kalyazin@linux.dev>
> >
> > [ based on kvm/next ]
> 
> Hm, given this touches a fair bit of mm, I wonder if we shouldn't try to do this
> through the mm tree?

Yeah, when the time comes, the mm pieces definitely need to go through the mm
tree.  Ideally, I think this would be merged in two separate parts, with all mm
changes going through the mm tree, and then the KVM changes through the KVM tree
using a stable topic branch/tag from Andrew.
