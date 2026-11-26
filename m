Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669481;
	b=h9WL/T36zf7b0K7lgjmWZDC631oJq10g0sUhDAEM4xIcnS2J2KlNc8C0+I6ZFkrQO5bD
	 AjXpdozBULkaKH8bi2yKSQmyPZav7iMNDYIZvxRMDcSeQVsF9Pftpu5q9izgu0b+6A1DB
	 lVdspmP4kGpHVtaar2Ihm1uNLq8Dau1hLKFNIrIw2jz7m+Wuefw5UkVHqZSvN7ENaOezR
	 VhOmS2rXvngntOzJbDoHeIGiSmgIZXoJDsoeXdCfgM7KwGLGci+Tpoul1z4GVkURd32Yt
	 9q9rVM6VOlQ2s357F85VTh/7v5fzVnQgo0NF6bdlZHHVJ2TZepdV2Vp+sumM1WzcwHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cH1jlSFhK0mGHsLxV8dy+u0fQutnOY6cmJtrmOpCEuo=;
	b=C9E7+TygxJej/aqigOX1HTfq2Nt8uT3lasgQDizCl3sScoR6bP4eLuvaqmVJ68Iomflj
	 8Y7tZFmkc0TudyJ6Nw5K84H94XsuPVM4GfFDRFQBMt4iFxKLc33XMBtGv4xsWg1eft91g
	 diDuaDa+5sei9xEYH2JAVJGEswgRMZPR4E0aR6JlSmUtSMV+UpIPaPY4EH28IwtJCVDDm
	 Ax85qdS6uQcgBzdnwe/W9mr4VNrFlD52TgSFYq1lGqkp8EospJuIzE4prWYLaH/TWnsTb
	 xdPntK8o8FYaA0Cj7jxPKLHDpDwSkg3ljBiMK59YQaUUb5+wUyj6sF8N4lPXsg1dd3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NdoTJs0N;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13982606A31E
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 05:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13982606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NdoTJs0N
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386bd881d39so6153925eec.1
        for <loongarch@lists.linux.dev>; Wed, 25 Nov 2026 21:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669480; x=1796274280; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cH1jlSFhK0mGHsLxV8dy+u0fQutnOY6cmJtrmOpCEuo=;
        b=NdoTJs0No9VTV7NLHrnLmDGoxyL+xDxBssIDIQWBq/k6VISvqAdIRx3kpZ47q+za8y
         /ctvMh10rGGXkhw+xsgyUNkrTk3fL8+CgSiHHN022hWF2h/ANTk6EI+zB5zng/csAStG
         QD6kn4C/v+eZc6CBFOQf7KMraEnYHOpG++CUmgVGM8FAE//JKIGDdYJNUxdTfrVdMFlN
         gMPg+w1dUHjT1pnI7FZEoOrfCPBTqjDWm6x6aJd553wEwQa3YMnuXbicgV0ocsBZpoGv
         Tk3rtsgJMBFEn4ARrgd8BIpnNUQPoWykDWfUCVdR9USJMti2mSoI/OOGytYNSorFwsVc
         M8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669480; x=1796274280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cH1jlSFhK0mGHsLxV8dy+u0fQutnOY6cmJtrmOpCEuo=;
        b=ZbnP6i21Sk+gzvOTPH/UEFza1qGDVpyy4t1gyXdzV+LZ9gumNHBre0NM1eN7oi+iWN
         iidnkqcEZAGevVjawGSu9bcrYKipBZj0zoI1TLiFTF+PcDLJmP8QF+A3vy9/ifR0obw2
         hp23Qe1BGUK4x0WEs2EskS7MSolVm55XtIhz/MfjkdLPyBKYGjk5neJmj8V/gKSLUUhj
         sBImOuCsKTPoT83R78F0ZCbgmTRmg50L91v5WT+N86IA36hU4c0Vk2uji9GqA+fEmZ4p
         a/ocFF4mhq2pPw5mmPt+Zf0iCJuSdshmw9mDCUT3ecPLiSwXG9yKyiRpY4R5mTj+KHbM
         6bsw==
X-Forwarded-Encrypted: i=1; AL+hErHwAG4RUzoWFEFmsZ8ylD1y6TWaxjU6w/AfVGZ3GhP7a+OV2VgM5LKxj31F7nygMdykzi1nnGh9tY4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8WSkz23zGXngxZzGTnaW3EtTQcpsWr8DrwPW37ffBDOuRXWWgG
	E0vMep7KJujFUuL9KGt95vehwy1r1MbJzmagpo85Wk9vClPRZ+ghJw+1
X-Gm-Gg: AZFdTZfm67gepa79OmaK6EA+DL14Cj3Khzc3riZ4VR1fkseu8nSHxQA1/sFX73psqeN
	dY4bv188C6Eq2LknCfBf5YVmM3sB/xszCkpxUcqn/ZVqGw3lDsAjPeZj8z3B6gNtzWUhOzCPuLa
	m/UsYzMT/ujsM3REDLZ6OtVObzs0Ggfvk7j30l6UtD9dx52YUielQnXPhJoRXDiUlVUEdiQiNMY
	0de9EUsTVhhPH+OUuTsL1K/boA8TalS6vC0HFSZXEpBKZoFcc/o+lGToxIT8wXFaIdurK1p0mRB
	XKkmyQxxOPcT1Jq+PSmBQtmWQy1doGwhzEv+u72LyrfHg30c1T147TbOf5NAUsBC0dYFGdq06cM
	XLNaK1Ul19Wfuuz6932r6oH/9XHuq4h2gq+HCiEz5i/yeP2Qtto4wHtzea3Zbs0jFEdYGy/W3R+
	2K9Z+0rOGvufJbpyI4Jl5i49oLa6g054pUSjAeREtacTwNOKndnZwsByGDFyPV+xZBc5FQs5j3h
	M4YAzT5q1vmYN1iYgtNFddQ4+I1pQqk8rTuSvm63nRr0m8OGLLJ8cBtBYGhsmvzK8e6rz38lcUq
	1k5bZh1B6nbW7yj2ozUB5ggUjrLBYQXETKTVgoxVvQ==
X-Received: by 2002:a05:693c:41cf:20b0:386:dfea:4434 with SMTP id 5a478bee46e88-386dfea468bmr861041eec.2.1795669480162;
        Wed, 25 Nov 2026 21:04:40 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm72015532eec.11.2026.11.25.21.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:04:39 -0800 (PST)
From: Gokul K <gokul02k@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Song Gao <gaosong@loongson.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] MAINTAINERS: Add the LoongArch KVM selftests directory
Date: Thu, 26 Nov 2026 10:33:51 +0530
Message-ID: <20261126050352.1957454-2-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126050352.1957454-1-gokul02k@gmail.com>
References: <20261126050352.1957454-1-gokul02k@gmail.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The KVM/LoongArch entry covers tools/testing/selftests/kvm/*/loongarch/
and lib/loongarch/, but not tools/testing/selftests/kvm/loongarch/,
where the tests themselves live. The */loongarch/ pattern needs a
directory between kvm/ and loongarch/, so it does not match it.

As a result get_maintainer.pl omits the LoongArch KVM maintainers and
loongarch@lists.linux.dev for patches to those tests.

Add the directory, and drop lib/loongarch/, which */loongarch/ already
covers. The entry then lists the same two forms as arm64, riscv, s390
and x86.

Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..801de15e736f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14326,7 +14326,7 @@ F:	arch/loongarch/include/asm/kvm*
 F:	arch/loongarch/include/uapi/asm/kvm*
 F:	arch/loongarch/kvm/
 F:	tools/testing/selftests/kvm/*/loongarch/
-F:	tools/testing/selftests/kvm/lib/loongarch/
+F:	tools/testing/selftests/kvm/loongarch/
 
 KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)
 M:	Huacai Chen <chenhuacai@kernel.org>
-- 
2.54.0


