Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E43286884
	for <loongarch@lists.linux.dev>; Fri,  8 Aug 2025 16:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754672017; cv=none; b=jXVaZbYV5g8hNYsSMIuMTvqNYjk8zTUtCx1OSgx1/ZtRAVZKB4gMhBMVNdQSC1QnriLG+DPrR0fyKJ0SA/pAy2Ap3TnRMherZGMcgv8uKKwdinOYjvHJd8jhjQm7X0UgYzHa1gzPP8Ac3hz/MKfjWDFiBP/Nosiqu1BcersdBHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754672017; c=relaxed/simple;
	bh=/hQZTZ0XYl1A5cz8z6l1NBzcXkmcn5S2TR/13EyAB3A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=edxplgDQojl67IWgEQEXG63r174jnHg7m2VHDazw87oh+/hWcfsBVm+QEXJBmjyBKo7znI97jBZeO37338fF8WANxrjPWJE3/Idjk4sRx59k/EjgThNVLmpO65gKKIrS5UtCluRssmzoeoFKOVunC5Q6bQUp2pFQRy3r56tq7Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IczqWSPu; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IczqWSPu"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4af156685e2so43516691cf.1
        for <loongarch@lists.linux.dev>; Fri, 08 Aug 2025 09:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754672014; x=1755276814; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/hQZTZ0XYl1A5cz8z6l1NBzcXkmcn5S2TR/13EyAB3A=;
        b=IczqWSPudcW8fGwkiK+PxhtE+8Ajz+sjW2HNt9XTJWIh7uG4QxXgVa10wozdKTR1ax
         hD3OJiOFHoEPtrweQS/q4cVdtFtrT9zU5m02sWGVSgKb8Net9pRZiGZ7KeLeqN2/j35P
         OnHoLnDLxhlUA5Tq76OH3fx9Dhw3fVkJstvvGzDsyzVp0zw7a92z6asSLL44V2st0aTL
         6n4PXi0KDV8HhL1q3dfDMKPPFu2ESnbxqni5w8/XWdUqsoQC8BFoJW5TheaRRml1cNRA
         DKXfQ+OV8qylOtZpmmwow3T3Y2rT3E2DcqTXMCSO50x1Qr3ZKkjiWTOb2rZQkQgka6SY
         8EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754672014; x=1755276814;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hQZTZ0XYl1A5cz8z6l1NBzcXkmcn5S2TR/13EyAB3A=;
        b=PKPbGp8rnmGN/Yj4CVh7v5jLono8QglbaahwfLz/3o1U5NQ+gbmxGK8D4v59tE6IbM
         Qm7O0K8J7x6F6OxPN+6PQ6jNqnbP01bcxh0zFiIZliUxENN2ue9a8Sdd7LYzdH3WQZ5G
         t8CpodQXS/p/462l7br6qIPZfaodmH/+az/p/6kzF2hnDvuQxddseyRavDhREZhF3Kv4
         QqDQUESHKt93kcdEm4n4TiphNtAnB0bOWQaOWzZ49J3sfPWf/Rc0Q40/dE5dt+awIa8q
         gOxDFfQzAOIrHPyhzp45q5ydak0Ef9W7sRjSShzpyLdL2YanV3poM+VSxzWUpf8z2TMH
         g9+g==
X-Gm-Message-State: AOJu0Yz39KLFZd+wpI5XvimTctAB0Esl+1W038w/xC0uVkhKTuWwEro/
	O6WZ00m5n+x59f688JbMbICkRhTu6sj4MdqdCM8xwwTfPsWuxbnILXAmjtHQWLUtOdVK5hwouYH
	ngMyOYCQ0pnesx1z7KgZcwQ6JNOL5dXJCGusz
X-Gm-Gg: ASbGncuI8Ne/6xDW9LdLzVxQ2lH7UC9KBDhwt7EG1Mjv0G3vwkzI2fnkYM8VWqkwLXI
	jy91fW+rljy93+0S+0VqpKmRZDznh7S+gsSjHhrw0ZGcX+lwVDBVfx2bcdbIq8nSrZGnPTnf/Y4
	QqPZLAhdla/QAwey/HXt715gMeACTfBnnzghG4oiTroBqtER89orF/Gfjd0TDl1vHZ9Eb3xpD1l
	/d+zpM=
X-Google-Smtp-Source: AGHT+IE9rR//GG8o26a0NQh95HLWv7j5VR8tUtbX9/nNz9NozsGFglr4hnj5C39i26nPsxq1opmZY7lD+L9R4NxJbvs=
X-Received: by 2002:a05:622a:110a:b0:4ab:722e:3b39 with SMTP id
 d75a77b69052e-4b0afd825e9mr34109781cf.1.1754672014147; Fri, 08 Aug 2025
 09:53:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sat, 9 Aug 2025 01:15:40 -0700
X-Gm-Features: Ac12FXwZZZzGXxf_mhSeXFek-CdyA3iExaLHG9CvRZhTgPdO_du0GwI6f65wmo0
Message-ID: <CAK3+h2x_N-UnQqz_=bQOK9vB8fxEU=4YQ3YwCpnMNW4i5uBkQg@mail.gmail.com>
Subject: kernel lockup on bpf selftests module_attach
To: loongarch@lists.linux.dev
Cc: Hengqi Chen <hengqi.chen@gmail.com>, Chenghao Duan <duanchenghao@kylinos.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Folks,

Hengqi mentioned offline that the loongarch kernel locked up when
running full bpf selftests, so I went ahead and ran make run_tests to
perform full bpf selftest, I observed lockup too. It appears the
lockup happens when running module_attach test which includes testing
on fentry so this could be related to the trampoline patch series. for
example, if I just run ./test_progs -t module_attach, the kernel
lockup immediately.

A side note, if I put the module_attach test in
tools/testing/selftests/bpf/DENYLIST to skip the module_attach test,
the module_attach test is not skipped.

Thanks

Vincent
