Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A8E248886
	for <loongarch@lists.linux.dev>; Fri,  7 Nov 2025 20:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762546180; cv=none; b=kBwsdDOAuONvrx0uOsM7bMMvzf4+7w8qanr4ILbGzs3tDD9Tj/EwS1oFuaFrrf147IXIlyWWe7v/qQMyaTomuMSqDcXkSv4DnWaKZ6x/1eyuc4/IYsywniVzdLIOmiGefrknWCxLjxSH5MpjUixfQ2tPmWijE1cn0DBmvQ3vQto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762546180; c=relaxed/simple;
	bh=Idr3E/zkkeCEv8V7VDTGlmx/cWjJFzCzAiP8NExxQUk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=NJI0NYRjYtBBL7CrkGDE7MRKqTes6dwPg7pUWnWd4aE/l5o539DPab7Ob73i5JzpJXZqY6agEDAATm6gcXDPc6sz3ARsd9kObdJ1qxhlclVGqQDeuj/M03I3zqkIGprUa/63QubuyYsEk7oRq66H+9JVs3nfojLs8zsJu3jCuj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/1nwnwC; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/1nwnwC"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ed614777a3so10109191cf.2
        for <loongarch@lists.linux.dev>; Fri, 07 Nov 2025 12:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762546178; x=1763150978; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Idr3E/zkkeCEv8V7VDTGlmx/cWjJFzCzAiP8NExxQUk=;
        b=Z/1nwnwC7nsYB8TZYPO+44sWPiUYHZKusXdhiV5Dnh2PcIrw6w+TIUE8fhk3KjnquS
         r9bQlTSp0kqilcVDYrIKUDYBZ8QiX7yqIMRlXPCydCQTk23Zv/2857mj7UwO0CuNwlJh
         EfhnggsXS6KncJIo4FHzDuyFYR0GYUEtO/InkNAaecvqSCU4GRlS2jXMiyIhc29hJL5f
         62o62FY2cbSyr/Q4T3jMRi2salmf2qzjkurih1bgmBZ7DZbLletCob9e5gP1RYwpygLJ
         mTEnaRRBL/umAMslLZKCtc+amXhfuVcsMfgD6aC9tguk2QaaURfmr1lv/RDBBQI4+qIx
         Otyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762546178; x=1763150978;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Idr3E/zkkeCEv8V7VDTGlmx/cWjJFzCzAiP8NExxQUk=;
        b=fLKEZyh9NI+aupPs4ZSqwMIKi3TkJFo5PTV2KDE13M/eBT7AFj9GOttaIauvNJN/21
         rwGOJ8QeoCCBbs+1dq2UDsB0BLeYhbrXLZeBqJWGUJc5TRmCiqNNuPxNK5lhEHjedMST
         7tMbjAxewrPMEGB3ZV7oxk6p0kORBvgQSayHWHrCwD8yGov10AGBSkim6mr3YBKpaL22
         juv71Y75d5yRxrV/maVu0k3inzDhDSbhsYR5g88ird+fmchU4IfnxKTnLuBtNOpkH1gO
         3X1BJ7DRm11cDaG2kIn0qGPuRqZUBFFUTHKfBUWsnvB3emRo5KPEBa4d8DJjbcGXhbtF
         yqBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaDOS5NwDLNjR6UTsRRrA1CKRLklJsx+j9HKbFJ8IRFWulAtJCxpBk6DDd+N5nvKBR1nZVs9ysyg4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiaOg8iLNtZjDTCowrnYjiSC3qIKGECIcWMXuqx7cpjidg4ZLH
	st6Mt1/l7ElUxC+B1wioNIQgDPM6YOcHGhxzIQEIobZQtKhkCAEagM1cngyO/QpckPCV0KNLv0h
	fMgWXYp6nWatBbc98lb6q2F2vOqzQX50=
X-Gm-Gg: ASbGncvKraLbWVJjsR8rnSArdOSQu5K1CFmTg1oou96/uyqQWLJB9jgmcDDk/VEahqx
	juIH8nTtaCcErQnUYTrdyUzU1uTjVgP1zJvL+xFdrOGtOoLScQFuaLnWspxEa4gWFF8yYo6CfhN
	rgL0wS64W2prbaZ4oHMA9PvITPrLGbNf20DKNLS/V0M5TmBvAP4UT355AJoeWWCItxJLooOYzYj
	2JiCgTgGzzqXnbHB8fYY0yseTVUnIAy59CC9x9BB4643ozNISAIWHDmcyyWRZZ2lEKDcY8=
X-Google-Smtp-Source: AGHT+IHxMNYE2agUs5ia3KtYOYyJ39kAtkS0Y0AdnWuc696h5UYKwOpNCsDewx+J37sAIHKpOdem4/yd6nMMNrA1O/8=
X-Received: by 2002:a05:622a:488:b0:4eb:a10c:de05 with SMTP id
 d75a77b69052e-4eda4fc4054mr4425761cf.55.1762546177900; Fri, 07 Nov 2025
 12:09:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Fri, 7 Nov 2025 12:09:26 -0800
X-Gm-Features: AWmQ_bkBhTo4BVYlj6KKcomjXdZbr-JbnqhwFs_A5lBtURF5cTA6PMnQVPji-5Y
Message-ID: <CAK3+h2wYcpc+OwdLDUBvg2rF9rvvyc5amfHT-KcFaK93uoELPg@mail.gmail.com>
Subject: [BUG BPF]: fentry on wireguard module function interrupt VPN traffic
To: Chenghao Duan <duanchenghao@kylinos.cn>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Chenghao,

Sorry to bug you and bring you bad news :). I think this issue might
relate to the bpf trampoline module_attach issue. I have wireguard
loaded as a kernel module on my LoongFire OS project [0] to have VPN
service. wireguard by default does not log peer handshake messages
unless kernel dynamic debug [1] is enabled, that I prefer not to, so I
came up bpf fentry on wireguard function
SEC("fentry/wg_socket_set_peer_endpoint") [2] to log the VPN peer IP
address, but I noticed that once the fentry program is attached, I am
unable to ping each other between VPN peers, then I compiled wireguard
in kernel as built in CONFIG_WIREGUARD=y instead of
CONFIG_WIREGUARD=m, the issue is gone. so it looks like there is some
serious bug with fentry on kernel module functions. This issue does
not happen to x86 regardless if wireguard is a kernel module or built
in.

[0]: https://github.com/vincentmli/loongfire
[1]: https://www.procustodibus.com/blog/2021/03/wireguard-logs/
[2]: https://github.com/vincentmli/libbpf-bootstrap/blob/loongfire-port/examples/c/wg_handshake.bpf.c#L31-L68

Thanks

Vincent
