Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FA42AE90
	for <loongarch@lists.linux.dev>; Sun, 24 Aug 2025 17:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756057631; cv=none; b=E6UyNvKjNh9LcSiMWBJcDRpGEoTUafRDHsuCxySXGNFlF/CghILoHO/iaVF7Z/UB+DhhEqzuTBk6emui6PRbPZNddmCkHT/CMLNeRLmo7VC/i+mKevhB4Gfk0jblGyD4MG67KSxEBM57mGPl+WXoC7LqNkr9aGZlHmwmDc2+O00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756057631; c=relaxed/simple;
	bh=FjCAjrvuuNaYOn6ZYz/76p3kTJGUMGhQ8aPRd6zRepQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PMKeEEjx3O/fPlItfOan5kSshQ1pPVjnorrjlzdiOI+FJVbx3x9/Qq7KSpGY6DEJ0rt1vwgZPPy5TNo4nZhRlQxzRDWh+2c0YGRQ9b8lqyscpS8gOl8o9vatZ30GaJAAHyXetGmm33iwTOCsfnncUjoR88XDG4Fe6kE+SJUlviA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imlcp7/i; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imlcp7/i"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4b0fa7ed37dso50224821cf.0
        for <loongarch@lists.linux.dev>; Sun, 24 Aug 2025 10:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756057628; x=1756662428; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dEPOY7Zr3NpRQlVvtFsI5CSE/KgeAv5rkwr3uFG4z0I=;
        b=imlcp7/i3Trzzp1bGHVnxJ3qWtP/0vYfTQMUOO5M/s4FwLwVhfqVo/TYOSQRTQDrOU
         stIKoMBSla5aB0DPoJgqgoJcJv76zGtU/DjXNDgFtJRTy7bZis6bP+UVpuCEZ3zKrhij
         P4dxu9UZSGC/ZUBNM85Ocsdulsus7PSDwfOOV53h4nSEC8WtCWorm7RzObTQ25xnE6X7
         U+nypWb/ZbADXbpquegx7UUKGaAZgnlxTTn2uvYl8ksrraLAeey2WG+o8lBJWv6YGrVv
         igfHQzxTlrx+RynF0QTMovTrla6+cQtonzooHGdFcaGongarjAPrgGySqS1r3ouV/7Ur
         iCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756057628; x=1756662428;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dEPOY7Zr3NpRQlVvtFsI5CSE/KgeAv5rkwr3uFG4z0I=;
        b=nMmbg3RFTOkwmaim1zhN923ioXX5P2Xdy2Mmv8rbFAQ5rTmK/xEZquFUX5jg3GtZYC
         EYbl2swggXaId4aSBPYGCtSpjcIaJtDGBnHoQNNszwMaEq9nPHIosX2oO9M2a1s+u4SA
         71JImgNakN/hqL6oEAffcJyOEGOQpRoNVFum5yWBSY/GdnqoNPufkDAV7Qbr9nEZ02nT
         oAzbn4d2nOnlfP5pJtlKastqjTTUAPCoy1uHNhOg7bZHULrIOtE2nnwCbsYCQzOHl8y2
         DeefS0+XGs3eY3z2gjZkvzZ3x/0SBYmooPCIea1oo+HxvV1c5qrI5R7R6vyZ9DiHny1z
         HfQA==
X-Gm-Message-State: AOJu0YztqGlBcys/q/42JDjnm7P/eN+4wIttf7Xl8Bz4OOa6TjFmC/jz
	cRSHFj/Luq65Ix0j0jJrMki75aaWXK37FDvMJ5Cp8/jC7+ni0hEX2h2J5qPPaR2baV+HtpEKwYp
	4AwYRaHoToJCamdxOaBh7PNrvV2pLbvfpmUw+
X-Gm-Gg: ASbGncugt1l+khSOc1iay4Yx+DIcN2c9lo1CaDgdxdEu+1lysofXhfdbU5QN1a1cW22
	es6xbA0qJbHIEFb7yqQNjSncZIy+pv/l0tM4W6BEOjrXROPEoOmk+/OXc014nmNy8o2ijdzOeFR
	+RJe6KkdLEt0UPVLZ5AUQ1mC+ZU/RTTsKJrkjihMoHtqgAZYzh0vxC16xHyDgsLoP3QtblkI/VV
	qWnvLEx8I8Y73ZHkw==
X-Google-Smtp-Source: AGHT+IGCRA47aS4SzwGeSGeEzFkh1FikuMeksoGo9k6iWCgXZ38PjTLOuf3JCf3/bnZDRmdnNGmQnIwheQJhvpePa5Y=
X-Received: by 2002:ac8:578c:0:b0:4af:1554:783 with SMTP id
 d75a77b69052e-4b29ff91168mr139573601cf.18.1756057628535; Sun, 24 Aug 2025
 10:47:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sun, 24 Aug 2025 10:46:57 -0700
X-Gm-Features: Ac12FXyLKHAJFiEjtDmolbVLHE8Fn1Usv_OJAHosqEEDOwMvkUq7NenYLo1PdnQ
Message-ID: <CAK3+h2wDmpC-hP4u4pJY8T-yfKyk4yRzpu2LMO+C13FMT58oqQ@mail.gmail.com>
Subject: Loongarch bpf selftests report
To: loongarch@lists.linux.dev
Cc: Hengqi Chen <hengqi.chen@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Chenghao Duan <duanchenghao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

Hi Folks,

I am able to finally complete the bpf selftests and generated a
selftests report here
https://www.bpfire.net/download/bpf_selftests.json.txt, here is the
command to skip the tests that could hang up the kernel and  generate
the rest of bpf selftests failed reports:

./test_progs --deny=module_attach --deny=ns_bpf_qdisc
--deny=struct_ops --deny=subprogs_extable --deny=tracing_struct
--deny=timer_lockup --json-summary="./bpf_selftests.json"

In my opinion after reading related bpf selftests code:

1. module_attach, subprogs_extable, tracing_struct are related issues,
that is fentry/fexit on kernel module function would hang up the
kernel.
2. ns_bpf_qdisc kernel panic is a separate issue and should not be tied to 1
3. intermittent timer_lockup test hang up kernel that could be
architecture independent.

Thanks,

Vincent
