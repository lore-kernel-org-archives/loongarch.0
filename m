Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A14212566
	for <loongarch@lists.linux.dev>; Thu, 25 Dec 2025 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766685867; cv=none; b=lYgWFfRjEddujaJvCqRYQaoAAVgpM1qDcnfkA636ZhumXV0LuBNx/TvWwyDpkIBCS8FUE7/rIw3h8OKiuA5uD7w1PoAurduyOII8gUEvrjcNl/odhyRBdf3NFZV21a3m+qV8zrZPLEQugRJRQgWUbLAh4BNKb1HXSNWLEtJCjLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766685867; c=relaxed/simple;
	bh=NOqQo03NlLWo/MBgg28O7kN3w89Dnkgkf/wivIxl/oc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=S2obTwN3P9DimOZjPUoEOAlE6xSGTpEAB4I6we9jmUhht7guBOwfN9C9mptHZycCczKf3DKX+eDJzeGe/cDrN/xngo2o1YWHeyWtqdLVD8IKAGC/rWrAscQoJSAuDtdlBxPbpaZbO4CSBcoJss1nnhfaneM/QqcqenvBbkpWrKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtzpylaP; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtzpylaP"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8888a1c50e8so87776246d6.0
        for <loongarch@lists.linux.dev>; Thu, 25 Dec 2025 10:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766685864; x=1767290664; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NOqQo03NlLWo/MBgg28O7kN3w89Dnkgkf/wivIxl/oc=;
        b=JtzpylaPWJO5R9RKImPshMCdqeBf1vpWaaSzs2rviHqPVEgjlH+JWXovNikSi/X2p+
         7QpaoZbOjHW/ivLH0Xvs2e6LD9I88lCAhhNshImMGRZxdispyc9fW0lpbCIga/rAUoGr
         o+IW4sXhXxRs4Y4Lf5jwXI+HkM/GpdEjUQrTJFoTWyQUMCigrbVDkusjngSWzMvhWt/N
         qPb0qPo8oJJEjhefheqQiTVyvPM2xFMbilTX6r+datoqINki4pX4clmWa/6aNkD/6QcU
         E2t9nGZq31QV4VDh333qf/gXfuQ/AET2F0OSmGy9jiwvw+4z5uqHltCaMvzxIPCpP529
         DqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766685864; x=1767290664;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOqQo03NlLWo/MBgg28O7kN3w89Dnkgkf/wivIxl/oc=;
        b=CGlfvpzJsZQaiJ0C1EDu2GvacBRiTe+7A+dVQA+oaT6il9cgk4NTh4HXhgFvEWVyCD
         Mg+JcwW7Iwwlp2KKxIQC5KLAiLhXFVtQWs9mBlk18gHnCaRvZJlMFfRdbiRjnB6PlTP7
         UOWi7C/ZjG8bTMd4Pbw21G6UGWsfFoDedo1brLeiqlRI83CwKkQ+aU1UXpfah1pGGOzr
         ZStvOZDv00gkX6y/8Nz7HP4dNS+9hV6/l3SY6Jsx64Z0IJuxlvNTWSo574MveYp/j1Wv
         BRMMO5bn8BAfqBabGq3s4d+7iPcqvHZqhjARv43R9MAuKgAcXeTbamkRPDuFVPKggSp7
         s1xg==
X-Forwarded-Encrypted: i=1; AJvYcCWTqgjfgIuOpe72AOeTRSR6qFtboIjUrgy6dLCWbNqg32btJ5xfG2/iBX3OWzB/8nnXA2zIxkrkUJ4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywap2PJqQCPrLvkB70ChqmUkyd8wT0aXvgrBfOyN2AravaFKGGq
	m0r3U5CQ9JEraC2OmDAQTO/1pgHypUmgNMcMTVJ+O3uFyK9vKDozB02CwSURIZjTe2Ns8kJODX1
	ZiIhjTbSHBdVWNXK/avSbFcYMDoPvT8Y=
X-Gm-Gg: AY/fxX7BPwkUzI+JOlzXbvtr8Daxh3UOWS44GnyzdJcKBhll4M1OZeMc/qsLysW6JIK
	O1QxnyjDFm60oVZHdWTD/62idi/7akjSLCk63IvpWjUv9rjZmZemmogR42Xh+pyBwkld85oCS/H
	7garFpUxU+VKdq2n+UfmAikCwq74CV152CH2UjZMuQsP38YceceW9y+YIrdcgvuHotmJkhWtZbB
	MPSjhQg3JMRYpgYQhNf2ZfFBIEjWQuJWwfdAp+2kC4IxIUxZKjZ0QiErvW5VJOs03iJGszxgODH
	ChhS0A==
X-Google-Smtp-Source: AGHT+IG8oGrwGUOp5j2XlBNdDC//0F/kWZglvFM5P53CTq59KYGqlRq7Zk51XyKT54ikaFEZTjPyrRM3mYq0SuJz7tA=
X-Received: by 2002:ac8:5a8a:0:b0:4ed:5f45:42c0 with SMTP id
 d75a77b69052e-4f4abdbe580mr321651401cf.62.1766685864055; Thu, 25 Dec 2025
 10:04:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 25 Dec 2025 10:04:13 -0800
X-Gm-Features: AQt7F2q0gcPT695Ko6fF8kPIYlxKSMImXKao_mrwdedjnNgjiy9fG_ioygx6isU
Message-ID: <CAK3+h2xMF2AtKKHAh_Xt0NEk+dsVg5KRZ3wspLUtktmeU2Z_5A@mail.gmail.com>
Subject: Loongarch BPF JIT support Load-Acquire and Store-Release Instructions ?
To: Hengqi Chen <hengqi.chen@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Chenghao Duan <duanchenghao@kylinos.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

While browsing through the 2025 Linux plumber conference videos and
slides. slide Introduction to eBPF Load-Acquire and Store-Release [0]
and video [1] caught my attention. Maybe Loongarch could consider
supporting it?

[0]: https://lpc.events/event/19/contributions/2163/attachments/1806/3886/Introduction%20to%20eBPF%20Load-Acquire%20and%20Store-Release%20Instructions.pdf

[1]: https://www.youtube.com/watch?v=iF7JXK9qxbc

Vincent
