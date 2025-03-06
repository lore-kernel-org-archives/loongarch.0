Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368AD2D627
	for <loongarch@lists.linux.dev>; Thu,  6 Mar 2025 00:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741222414; cv=none; b=Ls4uv3PpBbPA8Ldv1XAdnqLYeOI3+4CCNCfNVH5yqNFh2jU5b8uNy7Cv6xY1sGk4DrpY4yKq5PMuyJJJplshHYcKWcV7k/Fjlw+xTzNgoQtKG4x15hZSpbAtoecabjQAq5NxOIRVmKPCpSrt4M35rFDUKI6FHURy0goQptMV6Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741222414; c=relaxed/simple;
	bh=Rw1kmtfqLUgDal930cblReY6nplnLaMfLPr0sxIkQ7s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ukFK/rEsbYWhv4+KPcgk2onVBkKensi6ZPLHvvxyum90GArX6KFVwXPjmhPJq2Q7kMvzhq/L/Twhv1BCKAmr2iJMIdq0i2bOARxGOeMvpXgnfJLbN22P/+Rj9XI8bCEancmrTaJF7sBC0r4b/MSTsWXmGyndl2Mr+pk/aC4M3Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYow3V6S; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYow3V6S"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-475076bf02eso825601cf.3
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 16:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741222412; x=1741827212; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c/iDtRJ8gpqWGwZKHwjvAM1quDXC0ENX9NpnyYGCZxs=;
        b=OYow3V6SGiJ0Tr/84MMT44ucOdZqysuPZ3oqMNU1STvGZ1gvG72eO+oA37UCRZmgzk
         Cf3KjEtkvBsVGkG5Yd82UGEVLgPddF5RBXmnxCMV9yIqHnqw0xjvye1T+1k+I+OJwgk3
         GF2aOTRrkdE3ZKAvf/VWM91DfAW/hja+2myn2eNR+5ImmLEaRyc2Flm+SBdBXiJGR3rV
         UTtG8sXVrOAWZDE/MoeWATaRQUDePPtxFWy8waVjxKvfd8//dJH6Pv1jbsVoara7jpxy
         hItTH6BdieD5OKV4oucQu06py0j2zLSn7fol/oZ7llzBS3TVjFyZWi5/Njfw5+5oP12E
         RHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741222412; x=1741827212;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/iDtRJ8gpqWGwZKHwjvAM1quDXC0ENX9NpnyYGCZxs=;
        b=wq9+B8qPq+aPL0r+hls9B/WoNpnFcULNkcF4raSIxrI50GLjd06ojrSaBeiyWTpzpD
         stW3XCrhwQIeJ9cQE/AGsYe0m59PWlH1m/UbggyqtKdwQg34SQ44ADsXlJcC3jKEhQtl
         KpCITP+vnpTc48b/mVTCuY1wZhvLSxJx/baOTMRKqCro8kvNb+1QkIdy09c8o2VEoLb9
         ZxX2Jebn8b+y9jdMuIdSC6S8dJKQl46twW6u4Rq1DPz9PKRkj5Jz5zhnrckes3oMH9AS
         dMKgep8y+qK4Tt2o1TVXvKrskWGQebnn+Zj5w2WfO/jjJFECAPh0GEa2nMXTZjogJ2aQ
         duLA==
X-Gm-Message-State: AOJu0YxQ2ZrI6njCeM5eiRTRoai3rix58BpkYkOclGneUpAgK8etHrhj
	xZv+qwa8pwPZW8tfzQ1F6YWM2FHLJw0C2O9VeesINNitTKmgapzAzlb5og3S/mcjRZgwdCYNLCu
	nZoFwU52FM77qB0I+SYgWbUXwq5U8h5po
X-Gm-Gg: ASbGncs3pWl2crJZlnOzT+aWFeDm8r2CkasMWRjmJwHKHET7ZpYj4uFLKRQs1HbTv7Q
	z5dF895bRRRMYadwrXgQwNCDOAl3vYhsg/CfHgK/XDQwscGOmcVClAMDzj1Rf1uhll5vYG2B7Bj
	70c95Pt7pF7pzVvcelZD+2pYk4WQ==
X-Google-Smtp-Source: AGHT+IEIoeqcgyfVWSf8NJr70W8EMVrXNb1G32+5um3+v5ajfSSW+eaJL8FU/euvSyMdrKemiuN6tIZdUGxCnd+g9eA=
X-Received: by 2002:a05:622a:1212:b0:472:6e5:d7b6 with SMTP id
 d75a77b69052e-4750b248701mr65130391cf.6.1741222411911; Wed, 05 Mar 2025
 16:53:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Wed, 5 Mar 2025 16:53:21 -0800
X-Gm-Features: AQ5f1JqsGqfpbyj-1q5gXfpSWcJ8t6ZQQs_Mt8dvigJjCdIrpIVjgU--BnObQnw
Message-ID: <CAK3+h2w6WESdBN3UCr3WKHByD7D6Q_Ve1EDAjotVrnx6Or_c8g@mail.gmail.com>
Subject: [BUG?] loxilb tc BPF program cause Loongarch kernel hard lockup
To: loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I have an issue recorded here [0] with kernel call trace  when I start
loxilb, the loxilb tc BPF program seems to be loaded and attached to
the network interface, but immediately it causes a loongarch kernel
hard lockup, no keyboard response. Sometimes the panic call trace
shows up in the monitor screen after I disabled kernel panic reboot
(echo 0 > /proc/sys/kernel/panic) and started loxilb.

Background: I ported open source IPFire [1] to Loongarch CPU
architecture and enabled kernel BPF features, added loxilb as LFS
(Linux from scratch) addon software, loxilb 0.9.8.3 has libbpf 1.5.0
which has loongarch support [2]. The same loxilb addon runs fine on
x86 architecture. Any clue on this?

[0]: https://github.com/vincentmli/BPFire/issues/76
[1]: https://github.com/ipfire/ipfire-2.x
[2]: https://github.com/loxilb-io/loxilb/issues/972

Vincent
