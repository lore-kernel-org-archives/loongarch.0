Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F1140873
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 07:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711697102; cv=none; b=e0R5ThxD9V+E9YakzUS6xJQIJo67FxEERGJ151joK+xFf7/HyM5XH22grEoQgNdjFhAe0Uz6T2jaUMJCiPhRAWP0ZSa5RDpX367KUSvdykGr/V8LgavH2QP8/1y0qWPflg55OxKws+HpNTEqebUHkQwHEPrw8VfNcNBhXbpt+UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711697102; c=relaxed/simple;
	bh=dD+iV8uD7G5MpjHgE1LVjx/5PSgKP1NpMjf5jkr/+qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V9w02LF/DEoe4misaSe/yGd/VlkQcABtMsjSn9wqCSpwJ7QJJVlEKKPc2yecLKULk4IemEpmQPGjOC1GfgBcVrOHT+NxSDBIxmghsyBhizdb+yyiAlt+4MSSn5rbQ7oPFj0XxfuPCWyzjNDDFxUMVhzCW9tFkDRtz+X2wIp06G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=IpwlAx1M; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="IpwlAx1M"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5ce6b5e3c4eso947382a12.2
        for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 00:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697100; x=1712301900; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzRar7ztYXEnRyKAelp48saozJM51jVm9Dh1Zr4pH8s=;
        b=IpwlAx1Mi9jR7lHowLFMQUt9Wb36yR+rjZ1RE1P9OJx4a6A1om/iW7qMz76X3I77y0
         FTjpYPZvlKDP26EWH+9Px/0UCl4a1QGKLVdoWXEjdrktIso4NrZ3hmUDKQWXqwK4Stb5
         w7LoyMOj0cL7kMDUCsOienHzuDAzEznD5G7GIGB6hXjtkDUYXO4eU07quiH8/Rv6ziIw
         MNe3442DXd8eqoXsD2W7ZA5tcyCjg6vHnNiUv34gtBGx9WWwMW2e3sb6b0e5+tDAEpRb
         uec0I551Hi7sUKTgUgWRLa5JgZddAycgOqs75zT7FVMy9DE/d1n3xykUvmKESPjWegFF
         aEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697100; x=1712301900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzRar7ztYXEnRyKAelp48saozJM51jVm9Dh1Zr4pH8s=;
        b=VI+qtvK9n8wr7wNQGoGCSLFb6qEhrqMiPtOTvN4RZHNtFA1r1TMvGnzJVxl2PkuLUb
         BSZhbbnwafvO67/K3YCt15rGp9cQOoe7ImUUQn0iwIGCbBsBkcI3qGGrxJChPzPe0yNg
         Cs2YPQwZQWl/0pP8y8e0FCez5zCf1pztoQh0UjQpvDungZAK49vX5rb6n5lx9b3ZaV1O
         qXxMywCQfKeXBcrYEPS92LpBlGP6KrznLfe6TX/6fdbzkZYXrWn98AvWf5qlqp5SRV20
         Xf3rDcbHDZLn/jhPF0cDmrnGWXVKrwmvHqeRJob4gmgO2Mfs4cYtZ4RqWg9NmXroRqn1
         AsgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJZTbWDX0ecfjWzzj+f8aoz51uGpdMB93tEk9TSit/olK9PtAWZXyJp4EngcGfATcITWbY4cuLbmsft6+zWg4xxAYmeEB8nnkU
X-Gm-Message-State: AOJu0Yxea5qqQRNgYpTn36s8qvKSwyY5sgOe6/Q7y9QRL7MWooOd5FG6
	++WHlZvyJ0Xgg/MPqZPFt93IatV0uM8UoYTrca7j1gb9SJGzg7btAgt937b9p00=
X-Google-Smtp-Source: AGHT+IEs8kBZu3dBChnRywCF22OnC9/Ej+znSx9gblpEFd+wsOZOeprciOlW3fwk28PpRrFgoWrM2Q==
X-Received: by 2002:a17:90a:d3c3:b0:29e:975:3500 with SMTP id d3-20020a17090ad3c300b0029e09753500mr1446912pjw.28.1711697100232;
        Fri, 29 Mar 2024 00:25:00 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:59 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 09/15] x86/fpu: Fix asm/fpu/types.h include guard
Date: Fri, 29 Mar 2024 00:18:24 -0700
Message-ID: <20240329072441.591471-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The include guard should match the filename, or it will conflict with
the newly-added asm/fpu.h.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v4:
 - New patch for v4

 arch/x86/include/asm/fpu/types.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/fpu/types.h b/arch/x86/include/asm/fpu/types.h
index ace9aa3b78a3..eb17f31b06d2 100644
--- a/arch/x86/include/asm/fpu/types.h
+++ b/arch/x86/include/asm/fpu/types.h
@@ -2,8 +2,8 @@
 /*
  * FPU data structures:
  */
-#ifndef _ASM_X86_FPU_H
-#define _ASM_X86_FPU_H
+#ifndef _ASM_X86_FPU_TYPES_H
+#define _ASM_X86_FPU_TYPES_H
 
 #include <asm/page_types.h>
 
@@ -596,4 +596,4 @@ struct fpu_state_config {
 /* FPU state configuration information */
 extern struct fpu_state_config fpu_kernel_cfg, fpu_user_cfg;
 
-#endif /* _ASM_X86_FPU_H */
+#endif /* _ASM_X86_FPU_TYPES_H */
-- 
2.44.0

