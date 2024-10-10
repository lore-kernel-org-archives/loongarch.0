Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66B221A714
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 18:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584867; cv=none; b=sXyAeXPy/hxzoDlUE8F1auYOhh7/wWCURQZqejySN4qwjOC1xb3Z2eXpM67SUhMQCqIApgHcxENG0g2fzQ8UA9EaHlJTcycmVE5GHLcEEZdPdrihsHpf4q51fTFd81KDVm2qJJ8PnRoV4BVbt2X/0hohn+H7hvHhDlaBY1zL21E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584867; c=relaxed/simple;
	bh=Ioj1P42KohQLhw3WPnqB6EBTWlPlGqFgp6J41ckJwc0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LVWEEe16N6qm/EJ3ZXm9r3BhS3MfSgBo5jWcKtoFIYzN5/qpcJqbUsnjj120zgmcOBsXwBxpwK2lpqXkiIcSNJwallKB0jWiJC5Pbps6zvbDfYmFrm+7H+7GabKQYbUJRt1WrqaOIymG9EmKaIgdQY1I6xD/6wr4n+7GyTelt88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yfrmHeR/; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yfrmHeR/"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e290222fde4so1382413276.1
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 11:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584864; x=1729189664; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IfrRBwnhP/ARkGggvkJ//bNWbTHtvwsCnjZUdYSoz0=;
        b=yfrmHeR/mLLROmuPPZYDeQQko76sSxaCZvpf6gCcw9d9Ewmbna5Q51ba0gPsvubgu9
         DuXECjyiFh5f4tf7ssDI9Q8oERscNKHiMLtO1/AASmlt05y8Q5kg/S79aIVb8fDTV39Z
         k0rBSzfZByEUWGe/W8u73PUHuZ3SE3TxTzewNez5haiJTAmplOymSQmnt0mqOtaB2+jc
         kXFqtVABFmI+u7KLfdHIvY6VdRVb3TXAOUoZ8WSOQ7jGr+dh+NNHOCqmJ4ViB1gglqeV
         KoXx1riJLQoql/TeWu7C/M7dJZpbg9QN9fB6zhnlm3uQvDINOY3EYcVI932m06P6oWRv
         mtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584864; x=1729189664;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7IfrRBwnhP/ARkGggvkJ//bNWbTHtvwsCnjZUdYSoz0=;
        b=mM8h4+FaJgZ5HZWOT5ZQtm9Sm+8eJLijNrBPZ+3NoRvTIRysLuZkeN7dggNhDf60AS
         ZtPRIY9AWMczXxdbcXo7Z/HmTXpZxv7+l+eK8nUF+n7Wg7h3+E2Yi49FfDBoQlQLqQD0
         I6vE8E9SleaCjloaG+SFIVD8mdgSW5dgldbdw7B9tuKXreHHj0CE86Qxx5cZqQHg6+jY
         IVcZxGpJ8Tv1t6dCn/Dl1bTL3As/AZmDcWFDEtiAsQkBHwzq0h69+CUY3xt/yjyIpUow
         WGMh4Mo9K3nokUeq4ggUEk8U2aLp0JrS2gM71VyZzfZkBFEU/35FIa8JwyY6TALXxP3d
         tg3g==
X-Forwarded-Encrypted: i=1; AJvYcCVkdRWOyJND8Dho+ekhPxArSqW/KhvMfVTEXxJLePx9IPivJymJlW3xnmCrRTIuQVA+3DXRGfo/xKc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwbnUlTEHWHBtFZdLcSaX7AnvAsIrWIjqSeH6b3DXG+yg0QpEo
	LsUBcAgL8+Ca7/kjPIWNmVxH3byh4aQu8/9eLqbaGh/sjFn61qQ2c1yVTwy1qpyTcEqXxeCzYg7
	Y9w==
X-Google-Smtp-Source: AGHT+IEHmTL+CF0lwT1L0/srW8AumAgUZ3z+xXpT6s6F1mY7sAC4x3PdYh5uuuYsI/CKxaNz7ipzx99kqDg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:ed0b:0:b0:e17:8e73:866c with SMTP id
 3f1490d57ef6-e28fe421ddfmr136730276.10.1728584863963; Thu, 10 Oct 2024
 11:27:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:23 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-82-seanjc@google.com>
Subject: [PATCH v13 81/85] KVM: Make kvm_follow_pfn.refcounted_page a required field
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Now that the legacy gfn_to_pfn() APIs are gone, and all callers of
hva_to_pfn() pass in a refcounted_page pointer, make it a required field
to ensure all future usage in KVM plays nice.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b2c8d429442d..a483da96f4be 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2834,8 +2834,7 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pf=
n *kfp, struct page *page,
 		pfn =3D page_to_pfn(page);
 	}
=20
-	if (kfp->refcounted_page)
-		*kfp->refcounted_page =3D page;
+	*kfp->refcounted_page =3D page;
=20
 	return pfn;
 }
@@ -2986,6 +2985,9 @@ kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *kfp)
=20
 	might_sleep();
=20
+	if (WARN_ON_ONCE(!kfp->refcounted_page))
+		return KVM_PFN_ERR_FAULT;
+
 	if (hva_to_pfn_fast(kfp, &pfn))
 		return pfn;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog

