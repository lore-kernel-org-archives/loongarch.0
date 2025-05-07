Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD55195FE8
	for <loongarch@lists.linux.dev>; Wed,  7 May 2025 21:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746653454; cv=none; b=mRXdsssf0vw08NDIm84C+Z40p3bul65zNOCFagqN+dRFrvtsH0uhT7vDKr52EJsLOisyb3R04m7KbWi5nXf1ole6sROim4QxNre/eJvlTvEFFz1cn8OmN8YtghZWSaWgMtuOhwEldAoeUpgrCniTlJhQS7ODjfJPNPjbT9kYWZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746653454; c=relaxed/simple;
	bh=al1tSQnbe8goX+rnyBPk9zdbefwDs8Unyc8hKbgj6Uc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WBPqJs7mj4Qi5UY+4IYk03Nevororjx7finlqFyrZ27TjRH2WXNUjnIdIyfl3UtRalRjNbCSwgYRp6RMVBZT/Kmw0qTwoVq2HUYxDn9W2y5xLL0JrQiYMyE0bQ3gdRMyubXvRuvuVc8lKbuxDjMffNv+6ka6BuWOHVrYBUoQteI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0mB7LaB; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0mB7LaB"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso6150046d6.2
        for <loongarch@lists.linux.dev>; Wed, 07 May 2025 14:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746653451; x=1747258251; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OHdHT6sJbThl3pfYyLFv/2Hv99pNOUYCOQlGojSpGng=;
        b=S0mB7LaB8+4+o6dk1XONnbsofv93OPrK4fOuC3pR2D9tTVt7DF9wLzfMLkUhzsDsAw
         mJBPiNtdvHlAOMQ9kDQkUR9qbfBPtYO/7RCwW2xaV0yORUOa2SDF3QrmhE9v/Crs4O5V
         iAzIpxBMdgxre0nv3yxLUsBUkY6pADKmoSqh/1nt7fIIUYyKf7ziMLGjIX3db4Lo52Cr
         zeKEuR4SyNLVqswOabcw4cfnhEzAxvwB767NhzgbWN9eCWwIXvVbh0aKdRotaeW8OBBI
         5G+7vvamRBfPDMqdD5tEQ/5CK1gppOvhgwZNzAI+2cUrdpJ7mIPSlJ9z1HCR6syKv6vU
         Nr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746653451; x=1747258251;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OHdHT6sJbThl3pfYyLFv/2Hv99pNOUYCOQlGojSpGng=;
        b=qI5LMlhqFMTueaXTWjj0TZyj9lhCoYpaNXVezg+2q7dqsZB5XwoIav7zEvE9VhDJGl
         Ng/OOsdg0Fu8Ln6npmZmV61lqD7raPgl1+xj5DwVQ9XiFzC1mSZz2Cm/sAFCJudsIuLV
         5b+xozQWbvSIvwYHxJKqmUch77LJGP53cEwyR8CyI49+vtdiKww1JFxAUt1JeZxxbArT
         VfZdAXZMg5iVdXXN+RjXnOp+e+Ud/VM1G+tYr7UVeX8P6L38t6RptGt8F97HAT+v+1Y4
         iG6612Xbn3GYEm1BbpqI+ZGLEIh94ktcbmjD+Bd8WHAzUxEacrIoX5vIYY1rG6qhh1Q6
         suuw==
X-Gm-Message-State: AOJu0YyN0B1FQuAWxQhlDYS3Q9eC/ob2JqxS0SnezrIP6dbcKdjYONlJ
	NwdKhVxW3T8m+ZlZYvcTSLSH7aZzQb1qo/k3UHw11cxHklB/eU/YH6K+qFs9+b0rOSAKeD9ifQf
	yv2CJhVD3RF3SSXg8xFu3MULV47zHnE0i
X-Gm-Gg: ASbGnctD1iFQNAXsw9xnqj+UfkbIIXphSP0D76tTolq9fhDOcSbfe/QWsj5VGMKUhmX
	+71OVjXovnRzvsy2hglp2OlizhdnCIQRTIdChNvf6GNTYnInlBm8nccWdQXkwQ09sCmaL6WPdAd
	PQupEG8jvJ9+1XFq+RE5FGsL50sNXt4giPug==
X-Google-Smtp-Source: AGHT+IHt1+zx/IBUEMpNCsYMY+Ou6aTB386blQSTuYtECzq9pw7XCvz0jwz83seqBc6ZfkxJtHNIY6oqgDW3AE3/qao=
X-Received: by 2002:a05:6214:29eb:b0:6d4:dae:6250 with SMTP id
 6a1803df08f44-6f542aa3215mr76103456d6.34.1746653440451; Wed, 07 May 2025
 14:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Wed, 7 May 2025 14:30:29 -0700
X-Gm-Features: ATxdqUFfQKKYyJauQ7BMy05pT0Ja3iBMbptRZS1m9IGykxzLMmgGsCWcmTFks5E
Message-ID: <CAK3+h2wo3KidH9yrGSNsV522BSkUJyn2TUp==tSv62937xPDMw@mail.gmail.com>
Subject: [QUESTION] Loongarch bpf selftest liburandom_read.so build error
To: loongarch@lists.linux.dev, bpf <bpf@vger.kernel.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Hengqi Chen <hengqi.chen@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I tried to build kernel 6.15-rc5 bpf selftests on Loongarch machine
running Fedora, the bpf test programs seems built ok, but I got
liburandom_read.so build error below:

  LIB      liburandom_read.so

/usr/bin/ld: cannot find crtbeginS.o: No such file or directory

/usr/bin/ld: cannot find -lstdc++: No such file or directory

/usr/bin/ld: cannot find -lgcc: No such file or directory

/usr/bin/ld: cannot find -lgcc_s: No such file or directory

clang: error: linker command failed with exit code 1 (use -v to see invocation)

make: *** [Makefile:253:
/usr/src/linux/tools/testing/selftests/bpf/liburandom_read.so] Error 1

Am I missing  gcc tools for Fedora loongarch?

Thanks,

Vincent
