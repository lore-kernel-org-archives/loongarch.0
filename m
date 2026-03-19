Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEF230FF33
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 14:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929684; cv=none; b=P6p10gdJKMKqdPXi/x8aukvkfDTFX9cx3XG5wCngRWMBSCmesJkT+BjWP1eCnHPjntEa6WEwSV/WFzGFWsu58Vf2tztg0UyXfPoRkl7E9kMr+Ycmroa66rNhNXYxuiNbS6WHFV6KTkiRpZtJcamDC0JQzURJwBVDTB8Ya3XfC/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929684; c=relaxed/simple;
	bh=/nvuLQ6hKFv63U1YHBSa/Uk5cFBZ0KJIR4YblpPl2Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6tgK414fbBej8XNL5paQaSUnBwnXvGls8fa1uT2xFkDkRHixLn/SN4pEwJOwzKjWbHut2/CTEZIz07Quw20+VmYW+ddcAvCg11evZ47q+F/XtG6N6hcOCgWZCNGw3ihaabdpwaRSw2brbvW3JYd560wqfIKxQB2NBZzVC8FbDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwlmPLDz; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwlmPLDz"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-67baf20e8c2so370899eaf.3
        for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 07:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773929682; x=1774534482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntFH0htT9ffFrh9knb0jn+m+GRQSXC/6K3X5v8dqre4=;
        b=lwlmPLDzU1RBR3c21Lgrjj1lVJLFfy0E6ZCmwakVs29L4ty+EDS9R3AZ1Ql+cLFcYt
         gA2yHNBv6x7QzUxO0FUHvwdVMbCMzdopMlUOMSxpaAj+fwz2ydTxJtw2O5AzI9exKGcx
         4QRWP3Ce6AYRAjgcYkLy/oOyW6JijdH9eqhwK2vGj1TmAjGGwTxBZrCFXb6/ornpjhr0
         5zTejTBSuuutrs8AopqFD1jQmoFkF023buXa2ZkhQ2M2IAZDHYw3lbPvXsSziF48k0w8
         i1ZXt8qW/q8/S0a3+4FqiieLv3yWAaXyC9Qb4IYPqQPtsqQup11KpAiGdWgNWagGBdb4
         72oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929682; x=1774534482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ntFH0htT9ffFrh9knb0jn+m+GRQSXC/6K3X5v8dqre4=;
        b=esVVF/EIwLXVnPUQTQFhhg4X3HCPJyiY5cScH5Wg+vnphfAqFSgo5rVW2s/fo2m/1p
         +eRvXkUP6hCPkZP7sq488pvwmVz59bneWZ8lV6w9sSGM4T0S9YINZPmFZKFClPH44GM1
         0UQCx1YJyKonxXYCVbA+W/Hi+VnFdQoDfg9PkfEdFSUgSEPErZJiRNe4utapgvxE5rkM
         YdVBR+39SEyHiiu3KYM/wdNzmVNSZc+J62aDYQ/v/3qGVXSd04WOVILm5R9pCkuvL0Im
         r7HqfhT2MIrLi+zkWGbD9KOjouadl4bvgOKTdiHb47yyrzheFFitDUWXUaEhbO1hIpZF
         MDwg==
X-Forwarded-Encrypted: i=1; AJvYcCXwb+Lg/S1777QQVKnsRuHl3nayoJSaz9tm7kA/oVq3VbVpfyddJ7G5cu9JR3AG88WNXewuS5tF3uU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYFTZE8PoY4rS5S2CKkotLRLsaqwJkFwnzsGLWW/iLTVdzJOsS
	e9/iAct3IcZQtFJDdSkBR5lU5tNcRu5i6zOktPwDvI0y4a86y8Kxh0Pd
X-Gm-Gg: ATEYQzxOJLBTOHiOpBl0p6f/o6+IfyaXAtzXHbjThdMVoAxZja2r/eLJffuSrapHICi
	5VHk7+dEIeUMyXiI5Tq+t4gFLWfku9IXQENCDnz/R/irvZM6hJytZHJL9zW3huQhCThZCaW1IVx
	DgbQFUGc2e9pxAQr7sbUJqswAldRc/xYPClxNE8vdSHOGaDQzghu6JXRIBcTTZ4Cdo2sUVPY2ij
	nVSvJfumy2LFXbDj5K1V3se3du/nqs3kV2BRTRsBTB/JH+Q5bPVpiUspMPBSrXs8pq+jBYJ/5sC
	y5+ZdVOALLSr4iWdoRhnzZImdWcQnoU6HjOleq68Mo20LX+1Zf1u5qgbca2qZhy4F0O5RBHOAQU
	SK8MHmYJYg2SfuhDh2eLsnyAwxlYu1rpxeEYr/Q5qx1Q6t8m4rs9qxQdGCiY6S5SrMSN/L71a2a
	CvAgwza6HiQLirzzkyZuuC
X-Received: by 2002:a05:6820:1518:b0:67c:c4e:4ca with SMTP id 006d021491bc7-67c0dab23c8mr4161966eaf.29.1773929681867;
        Thu, 19 Mar 2026 07:14:41 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:8::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41bd689e3cdsm5313808fac.6.2026.03.19.07.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:14:41 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE
Date: Thu, 19 Mar 2026 07:14:36 -0700
Message-ID: <20260319141439.218078-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260319-config_migration-v1-1-42270124966f@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 19 Mar 2026 09:19:40 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> All architectures that select CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE also
> select CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG. So we can just remove
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE.
> 
> For CONFIG_MIGRATION, make it depend on CONFIG_MEMORY_HOTREMOVE instead,
> and make CONFIG_MEMORY_HOTREMOVE select CONFIG_MIGRATION (just like
> CONFIG_CMA and CONFIG_COMPACTION already do).
> 
> We'll clean up CONFIG_MIGRATION next.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Hello David,

Looks good to me : -) Thank you for the patch, I hope you have a great day!

Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
