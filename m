Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDA079FF
	for <loongarch@lists.linux.dev>; Wed,  2 Aug 2023 16:58:18 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d114bc2057fso11242276.3
        for <loongarch@lists.linux.dev>; Wed, 02 Aug 2023 09:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690995498; x=1691600298;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PzbCDXFnk3w2SSf45TXB2yxLMTvmATReUsA4zCcZwws=;
        b=lyoh2SBz23Xi/1oythXCvD4eYT/mDAOe1c1NCuMnLDbp/ZF1fVWTZSS7U8LfcMunzP
         jkvpro9VFgWnjS2rIuQKBJORICyNhyf5NOWNBck6eMYluV3+8yr9OmHJ345iUgzR1c0R
         tRd6tvQUb71r2RPXSvUWe2DEcA4tQcmDlsNvbWIQUYfsb6stBllbtNrWVjJy6HEnXGoJ
         zZat4XSMBiInPICo94A+caZSdOnVvOcAzZvymmXkKrO3bOSubnDyPyZ+k50A3aT/BK3z
         AucwqqUgcTPSCT8zRp6TNveYxdxmpZNU2X3TsgfbiaSFvqUqk0vEnyCDp0KIvCrp74RX
         u5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690995498; x=1691600298;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PzbCDXFnk3w2SSf45TXB2yxLMTvmATReUsA4zCcZwws=;
        b=i95kANlKBr/7Pw5irUW6UCoLiVc3YFOedvprSbP9SmZQQa1qjLJbaHPi7JGX2DbHDB
         w3YXzrmKCpgEKQgtZjurW7ei7j5SkVK5a95nBU6s+Nm3/IUV1uzpqeHfRpTl3depwU6M
         V4j4AsTFKHSbKn7ZduutH8MokdLxasvGSxxpajGBMWbcJoxmay6tFzr1LP32uLh8lF5i
         eBTjyL1b8u+G9WvjZr0wGWRjkTS7EzBn6FiQ3Q4gDbmUG0o72lBR6pL+ZaNgE25GFjTC
         yt58qc/9mox1eb1x7lCzXIYzj81Ki+6qGBVk41X76XtbOL+9HxT2lvJpRqH0q1rY+sXy
         zIhA==
X-Gm-Message-State: ABy/qLaBYWPhE3jSjteBNVEuCeFtddV5uIAce/dIrxnIW7cCwimek0Kt
	gFRT9F92bS7CmqBDBCHQEQFzfxnJkdQ=
X-Google-Smtp-Source: APBJJlE6rEuH8LasDnQfODkiDH09tFBtZ4sbu1M/IsR0DKMHMrqdBmEz7WgWDwSbKp4OvDE+w/rV2l2PoNk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:4109:0:b0:d10:c94a:be7e with SMTP id
 o9-20020a254109000000b00d10c94abe7emr109911yba.8.1690995497821; Wed, 02 Aug
 2023 09:58:17 -0700 (PDT)
Date: Wed, 2 Aug 2023 09:58:16 -0700
In-Reply-To: <20230801020206.1957986-1-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230801020206.1957986-1-zhaotianrui@loongson.cn>
Message-ID: <ZMqLKAWRapQjGgWR@google.com>
Subject: Re: [PATCH v1 0/4] selftests: kvm: Add LoongArch support
From: Sean Christopherson <seanjc@google.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Shuah Khan <shuah@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Vishal Annapurve <vannapurve@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Peter Xu <peterx@redhat.com>, Vipin Sharma <vipinsh@google.com>, maobibo@loongson.cn
Content-Type: text/plain; charset="us-ascii"

Please use "KVM: selftests:" for the scope.  There's no "official" requirement,
but I've been heavily pushing "KVM: selftests:" and no one has objected or
suggested an alternative, and I'd really like all of KVM selftests to use a
consistent scope.

On Tue, Aug 01, 2023, Tianrui Zhao wrote:
> This patch series base on the Linux LoongArch KVM patch:
> Based-on: <20230720062813.4126751-1-zhaotianrui@loongson.cn>

Is there an actual dependency?  I ask because I'm shepherding along a series[*]
that will silently conflict with the ucall support, and in a way with the Makefile
changes.

If there's no hard dependency, one option would be take this series through
kvm-x86/selftests (my topic branch for KVM selftests changes) along with the
guest printf series, e.g. so that we don't end up with a mess in linux-next and/or
come the 6.6 merge window.

https://lore.kernel.org/all/20230731203026.1192091-1-seanjc@google.com

>  tools/testing/selftests/kvm/Makefile          |  11 +
>  .../selftests/kvm/include/kvm_util_base.h     |   5 +
>  .../kvm/include/loongarch/processor.h         |  28 ++
>  .../selftests/kvm/include/loongarch/sysreg.h  |  89 +++++
>  .../selftests/kvm/lib/loongarch/exception.S   |  27 ++
>  .../selftests/kvm/lib/loongarch/processor.c   | 367 ++++++++++++++++++
>  .../selftests/kvm/lib/loongarch/ucall.c       |  44 +++
>  7 files changed, 571 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/include/loongarch/processor.h
>  create mode 100644 tools/testing/selftests/kvm/include/loongarch/sysreg.h
>  create mode 100644 tools/testing/selftests/kvm/lib/loongarch/exception.S
>  create mode 100644 tools/testing/selftests/kvm/lib/loongarch/processor.c
>  create mode 100644 tools/testing/selftests/kvm/lib/loongarch/ucall.c
> 
> -- 
> 2.39.1
> 
