Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F3AC139
	for <loongarch@lists.linux.dev>; Sat, 28 Sep 2024 12:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727526570; cv=none; b=IKPk0Aei1ib1w35EyQkpVsoHxfIXmZveODAC/1bTByjw1VLL/7DyR4gnBNIHbTVK68W3055Bcm18V4TrK5b6EnMmBJqmZ5PSfw7BoOfeN+e7JePzn8qg6dq5DcRc/Sa00YJbUsLyiKlHMiPi8bZD+Fahm8Q96ec+v3zNu+TZpb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727526570; c=relaxed/simple;
	bh=PIPOQV5MlwU2RVHtw0BN/7aQnZ/vufiz0PMYcF8RlJk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OL7b1bGgqPtk+tHvRh7mMJVzBiSp+JoJQZ52ZCIwwqy5dQra/FtH3DcGy9PEaOaypXJpGjsiUfZn1G7uauIwm61swVNLcQZNxu4hXSBqXe1DT9TtpN17AX+LbpzY49HJ3vZG52waVKYeHUBzYgjUbcQ2GtGbgBDr+mPmEOeP4lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmFtiBc6; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmFtiBc6"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e09a36f54eso251104a91.1
        for <loongarch@lists.linux.dev>; Sat, 28 Sep 2024 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727526568; x=1728131368; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aJ8WWUuKvf9GTwro0OMwJuCEfHPckI7kPW/dWv3QOLk=;
        b=GmFtiBc6T5EsRAkAxsuu0JBgIjNE6HuGrcgMm+5JqhXBhic85Rcyj1vNimbP0RVKA3
         pI51+mEQGABDzxNLohZJO2CXFtYpnucS0FVPBJ34+jki29hpJtHqMaTtOTqcBZTXoDNO
         fp7WZQUrKFXraks19lP4Qy/WOMUNGyM6tCQiwPQ8RtNANGJ2Z9rkDdK8YWgAK7nPCHxw
         Jdn0LMwEGhpJp33pgjV2nM1kMDp/vtcU48Qe7ujC3pDVJAxiVtsfD8wn6SKlonIAP6UO
         YsqyQXfGed1yKS8P4bS2vdfF1/CoeYX6vjQNaGwQYkBGdglUqr14HY8qp63XDpqDO6ia
         8blQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727526568; x=1728131368;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aJ8WWUuKvf9GTwro0OMwJuCEfHPckI7kPW/dWv3QOLk=;
        b=CbjXwJge2qylvPvanqd2IZWdP+rUnuTwPOEO3i21+PKEIlFokMt/WyeayiIGQ092qy
         idrKvE0YmUqWinXr0X/D5/TLMj5Gy2b5x4heP77knv4HS1oyWBSgP8daSFIz/7bxUDvI
         fEieSL/ZaAkRkfwd5FCF4PrR5L8gE/spAY4/i8IXsWimYxO4aJ4dkXNMZYbcWvA1Yvrl
         bCBwV7LGmNShD8/7vhw1AtQ4y9W0OBl0S4nUrvtHQMpK6DEXReLCxvj4s2RQYgnpvHj2
         w12d7juxtJZMqCEodBD1rliY9z5rgDa0euU+euq+McfUvr2u9n/RqlZw3vldL70fJtJ+
         UCoA==
X-Forwarded-Encrypted: i=1; AJvYcCWUVPWrQdYWuASBqXzq3h++yy6kyamXu4mI8WBMPsaQtVcWonekVQB/TqQuqOx8RgVGH0K9O+XOu3s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9OQtv646BJTJWDeXppLqHElOWcLLsR4Uo9NQ2ig54j3cpjh/9
	gtRotV+1GeBEFGk5RmON1anid0Z2mlleKr9wH5aVS82WZW2mut1iLmcSMseYpqacqYqUblKInLj
	YAz4TgiU/SCYZXpa/VvABPsJuEvY=
X-Google-Smtp-Source: AGHT+IGrsUANfVoELlzbzZj9rBQitM411Hn/UBFZLk+pIRQJmK6O2cia7wFzai2ecugfJm8Cq7orrx/FJvs+zVCFuQI=
X-Received: by 2002:a17:90a:db56:b0:2da:74ed:b35 with SMTP id
 98e67ed59e1d1-2e0b89a68e2mr3049595a91.1.1727526568175; Sat, 28 Sep 2024
 05:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Sep 2024 14:29:16 +0200
Message-ID: <CANiq72mHQ0eKJoZeRxB5h1eHza8nERA_DtWUMKecyQuivH7SXw@mail.gmail.com>
Subject: stable-rc/linux-6.10.y: error: no member named 'st' in 'struct kvm_vcpu_arch'
To: Sasha Levin <sashal@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>
Cc: Greg KH <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sasha, LoongArch,

In a stable-rc/linux-6.10.y build-test today, I got:

    arch/loongarch/kvm/vcpu.c:575:15: error: no member named 'st' in
'struct kvm_vcpu_arch'
      575 |                         vcpu->arch.st.guest_addr = 0;

which I guess is triggered by missing prerequisites for commit
56f7eeae40de ("LoongArch: KVM: Invalidate guest steal time address on
vCPU reset").

HTH!

Cheers,
Miguel
