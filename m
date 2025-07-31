Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD5B376
	for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 02:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753928525; cv=none; b=qnHuiQbiN3S1K1nlgWCtbA7kfjTy45GmPHl5eQPZ6Zqx4E4MYZxzIzXNb+HNE7z774wck0gxhDr2Rq2v2keZoHrIPMimNa/Vasa6JGZTg1Sl4AhA+HHeOyYB0CYVyBfnBylfF1P7flGC3Apb7qWED0k7I5w4ShtZqOPSZGOY+ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753928525; c=relaxed/simple;
	bh=C+xJld2AufiQNEEK5UgAgmvVy8BWvt1YJWdyGbs7uAs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=UFLAafvolj8xo0s1AF8ckxF/JhYx78xomGmvYtwx9kDXEHjoTZZmfi0epPnyP72OF6aL9PzXNdglgdgRi7TpKc6gBY1Db6MX07lp0lyISh3NkA0HxCxCSK8jIPa6kxyO8sdoaslflhW/Wc5D9N7g00ieVqly+/pui6Aq0T3aL9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UH4X0B+m; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UH4X0B+m"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7e62a1cbf82so38091385a.2
        for <loongarch@lists.linux.dev>; Wed, 30 Jul 2025 19:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753928523; x=1754533323; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d6Kn/I92XuJP6SYiiEbmYpQzS8+sxaF9v/+EYX8RRUo=;
        b=UH4X0B+mmFzVzg7K0B9MlQeX1vd3mJ053WbQvYlbJ8cl51v4ci8aLqx6OuG2uYeWdB
         6ZFCjF+JGVy05FKLlfjPznniQeEPJmBI3LWIeJ5l/d7Hy+cFhy3/FM58Rlkgs9mKYK1O
         rwLEg4NsiQ6UW+SteparGMvfUThIW/1a5PvvyrbSZ05fA5miZqcyRxg7jZ2Mu9ZaGS4x
         CktoA02/iG/qTz93+hC2Xl8eABsK+tf44MlXYBpRsp4gsxSZCKRuxP5e3m2cHYawjIBr
         UsJ7RCiJ1opK32FOT2kwiQL8HlRMhoBgONReeVCFJT4KWzCX0fKV+PCW4l9OkXvGn++6
         blTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753928523; x=1754533323;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d6Kn/I92XuJP6SYiiEbmYpQzS8+sxaF9v/+EYX8RRUo=;
        b=iqRdtH2nQ3fqkcQRtKcAfmpLLsQSN/himSG5RbO1nqb78M7TuuBAyZ2JJTGN2uyKxp
         wJMu1lbQ0VJQrpBe6HeBY2RYCX5jZ/l+Nn36itMUZoma4NQ0yE9BDnk0tRyAXtc/VDlR
         mBj5bBywO0mth6lUCaMAjS7JbCiYmipau7TuyDfkgeUHNye/tVGI74CSeUCjYP3Afoyn
         97S3LAG7eY0sXuh5m6l/zspJPueIfNXf8ZLT/nDLPzkEoMfFwwZCo3l6SjTGvjZbXu1h
         MRKjV2rW12PAl3HVQzgorueqpQ4+SjYlRE0rlouBxl8n9FJsIRX9QkjvDxhEJ1DIDZZh
         d1zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmxC0W0E9e0QnWeBWPj7L/KxZ4VooBvqNjhhurG5Ve2rCD1UBx5EOff08BE3QPMwoJoq4q7P1cyqw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPERk2t1m6wCzzcBdtlwCEfRF2deSHfoQnBGApM/7dK6ykdxXB
	F5nGYGBDvxRDjTgcS7NtJX9dVXdMSzhhuDuf6ap6Ps5kQkW8BaDM8u0CZJz9dTUTWUcOr/KJDEZ
	c3aXKWG4mr+NUQeaC0wco8jIi4GLhFFwoHgUO
X-Gm-Gg: ASbGncs1zW4khqY4kLcauHAx7tlt/8NkGZVZD5o5f/sTUQN76wRLCxsF0uTdFGl2Gft
	JalpbnUc6eWVoMt0U9Q5hq7hIbhldcqCUp2fQ7bumb2LLG353rsJZWp7sTw0r8nizX2i09IAj1k
	8mrCmrWFmwI07iGZHCk/j8WteZPO4ol801HwN957GFk9wmZ2NWj5enngLCpzHWn0aFjm3M+I0Ax
	x53nZ0=
X-Google-Smtp-Source: AGHT+IGSq1F7lLR96yU1m1zZCkdagVVP+tG5LZOVh/V5QAfXKiJg6//4liMpBK/WVNVYyHlvf9H38eydXvXzBEyTSL0=
X-Received: by 2002:a05:620a:2057:b0:7e3:4014:f322 with SMTP id
 af79cd13be357-7e66f3625eamr576504985a.31.1753928522969; Wed, 30 Jul 2025
 19:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Wed, 30 Jul 2025 19:21:52 -0700
X-Gm-Features: Ac12FXzJNT-BcKxdaNzGyLjNaGwiC0HoZjAZL6avIf3VMp3I06Ch48Pre4htwts
Message-ID: <CAK3+h2z3Zx+0KbVcRbLuz_-LhBwov9Bmvp9HdumbaN5GYtovFg@mail.gmail.com>
Subject: bpf selftest build error - undeclared function 'bpf_qdisc_skb_drop'
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Chenghao Duan <duanchenghao@kylinos.cn>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Tiezhu and Chenghao,

While attempting to test the bpf trampoline patches on loongarch on
top of https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git,
 I ran into bpf selftest build error irrelevant to the bpf trampoline

  CLNG-BPF [test_progs] bpf_qdisc_fail__incompl_ops.bpf.o
progs/bpf_qdisc_fail__incompl_ops.c:13:2: error: call to undeclared
function 'bpf_qdisc_skb_drop'; ISO C99 and later do not support
implicit function declarations [-Wimplicit-function-declaration]
   13 |         bpf_qdisc_skb_drop(skb, to_free);
      |         ^

I am on Fedora 38 ( I should have updated to newer Fedora :)) with
clang version 18.1.0rc, not sure if it is related, wonder if you guys
have run into similar issues.

Vincent
