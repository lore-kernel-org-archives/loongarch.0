Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA47B166F1E
	for <loongarch@lists.linux.dev>; Fri, 30 Aug 2024 04:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724992586; cv=none; b=fL2qd8vw/Yl+phKVDbeGFLL13WKBvApuEYk0GUTz6XWWJBQQkcPZcjINKUs2DEHIDDHTuHcBnXEZ0iDGuCD63LFpBsH50xSqUeWLwIEeevtOokIE0sZx9cjL796Fl2660BI0TiHTcenAj6J+s1/upzK5WoONSPdJ7Od2C6pzeqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724992586; c=relaxed/simple;
	bh=91b6MHuQTYrC/IH7LI/hDXxUWGMJ9NnNXDEb5najA1k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e6o2EHi2uQ1YigK/2V3kN8FLw+95Ru++s3e4aNudsGCOhjKA3/VM/OMfcLYDn7NAJsgxkb10SPzBoMpwlaqLr3LPhP19c3ZZ3nsCSYVRnloeHPgsDqv+9ldcByt5mXjYlgLtEx+QC72L6eiqmQsBW+gmFFHYruUvC0iWNWGnvAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SQn1sRRX; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SQn1sRRX"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6d4629210f2so727237b3.1
        for <loongarch@lists.linux.dev>; Thu, 29 Aug 2024 21:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724992583; x=1725597383; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TE+5gi+Y5s2UjnUAG5iU9KHZtarmS/zpW8eo5VQ9zdI=;
        b=SQn1sRRX4x4IJWqj0sM8ScfOnXdRRRN+UOHyRpEbM17M1SagHTY0b/JE1NPtnhtb/S
         gGGMb1pG1clQltAXtJbObdLktIks3TmVf/T2P+FvgiatowA2OKVg6H9t/INxC7G1MqSm
         UlSLvZN/yNbdaYqc7SgQ/YbsOm+AkI+4maqlNCdG9oJHF3kn2UgWPdauEGj8EOPEymkO
         0IcQuFY4/Svd/O/ILQyA6ejbnc+5mtu2EPpp4TRmJEJcl1cY6ZCoaWpRBwjGV0TMxJe8
         0gatieOzQK7e9hv+p3od8HBtW/Q9wx9//aZ7n93+DhOE7PuDaiMSNGLInu1stnYLGfSa
         /6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724992583; x=1725597383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TE+5gi+Y5s2UjnUAG5iU9KHZtarmS/zpW8eo5VQ9zdI=;
        b=LLSGEVfgaChM66ZxvRHsf+eYupBvCaOKkJpPuHgY62JA+Fuci/znY2JdQlmbvQwhwO
         PWx9MXH2Yfqw8VDPjFKwPmwWgjGYU099i68oAN6eIhDRdVoJOEHXXK16SAOAwfxYjnSn
         EJ2bcryhC3R0g5CrCzFQvJPSrk7heUcIbyHnjm/6BP2PLnIXXUt/H/IhKrJpoBdHILCR
         3F5wpFH1g0KG8mQsn2csmsCQ6edqBU2Pp8z6z+VFjlMaj6t5C53GJMlqaa7CpQZdPFMo
         LHZt1sVE39Lb1YyTstpZQjXSDW04PS+RWjV7yxwW9SrFZTVSlSyIWWtWpIud1Xb9vwAr
         Y2zw==
X-Forwarded-Encrypted: i=1; AJvYcCXm1EmcYIVe4naK7P4rFi7TKV6iiHSKWbPFFW6OYorUlSZtx5dEcyQUXFyt6AsQwbNg/jhoG4bgTkw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwEs26fR6l+FJ5TmMQy7jpI42jNEelnID8RDvz94sO9X+4EyjT
	XUK5k3mXq0w7edttAny5zZTCnY4ThncK66kkNBCyVKoTUyubsOzxUucPm1n/jfREkdVGazy8uZW
	7HQ==
X-Google-Smtp-Source: AGHT+IEXYjrPpdSD9GCwnZ0KjOxH9R7+gkyemXpF0saWXSC27VIOQKo5mk3or2G4Gxywo/W1sZdwv4+QKmY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:dce:b0:6d4:30f0:3a74 with SMTP id
 00721157ae682-6d430f03e05mr846777b3.6.1724992582796; Thu, 29 Aug 2024
 21:36:22 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 Aug 2024 21:35:59 -0700
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240830043600.127750-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240830043600.127750-10-seanjc@google.com>
Subject: [PATCH v4 09/10] x86/reboot: Unconditionally define
 cpu_emergency_virt_cb typedef
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Farrah Chen <farrah.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"

Define cpu_emergency_virt_cb even if the kernel is being built without KVM
support so that KVM can reference the typedef in asm/kvm_host.h without
needing yet more #ifdefs.

No functional change intended.

Acked-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/reboot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/reboot.h b/arch/x86/include/asm/reboot.h
index 6536873f8fc0..d0ef2a678d66 100644
--- a/arch/x86/include/asm/reboot.h
+++ b/arch/x86/include/asm/reboot.h
@@ -25,8 +25,8 @@ void __noreturn machine_real_restart(unsigned int type);
 #define MRR_BIOS	0
 #define MRR_APM		1
 
-#if IS_ENABLED(CONFIG_KVM_INTEL) || IS_ENABLED(CONFIG_KVM_AMD)
 typedef void (cpu_emergency_virt_cb)(void);
+#if IS_ENABLED(CONFIG_KVM_INTEL) || IS_ENABLED(CONFIG_KVM_AMD)
 void cpu_emergency_register_virt_callback(cpu_emergency_virt_cb *callback);
 void cpu_emergency_unregister_virt_callback(cpu_emergency_virt_cb *callback);
 void cpu_emergency_disable_virtualization(void);
-- 
2.46.0.469.g59c65b2a67-goog

