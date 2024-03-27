Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23552131BC0
	for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 19:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711566677; cv=none; b=u8eaIPpomqyFRVb1ZkT4pf0BSYQmDvvo1VL+Ftc5Q1JQo22a/CrFlzffPxl2BbmdGtbO5tV/MYJGcuLwZ7iQfL3KxyUBEOy/k/qFZRQmTPNpITEMrqk9SpBd3ZQdx/600ZRZGBd3BjUYj8bhAfytPCz7XuRQ3Kw9oqds0CoJVYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711566677; c=relaxed/simple;
	bh=yUAA0BJ8Nl10uc+yAPFqh+mbWstKhbqNExQFYIgajKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BOzw1EBpXkjowsWFNumcWrfHFPADUsA1/sRtb72mmpM7iLDu/Ul+K7TOGpkUf4h1D5e5tOGCCzozPlwiKddLPZytyaw0swbe9VUfDw6UVbHzzoRvgZZlelHTscBGx52p60Lh87nP6gvHOZo6RSIpZLUCZVaYuZzacSbmeoORxJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XL3xGH6b; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XL3xGH6b"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e0d654590bso1483345ad.2
        for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 12:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711566675; x=1712171475; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4NMdyhQ5KQf+5t3j22eJ7oXRafJFy4NN7UKLX5AVnPI=;
        b=XL3xGH6bMVs1Vu/C5fGNMQpBXKFp1mMl64mepDmkOr8W6TIB6MY2tjRiF40rq+cIUZ
         U263FBPdTvNETo9K48kNzt/zYB+eggVaBnqWJ5/NLt5qDxMfafG4S55sO2pBNjYRp7qn
         3aBJIrvyTyBF2dBM0Y2QscxpsgGb0BO14HBxF1smj7neJSPYDBllotA47TWz5pblns6a
         p4nbLAiT2pC24ifpyfrFdCemGSunNHhp6NMWdSi7GnVYHWTEjRt4YeisE7GXYy58WvcI
         fGpcbmsOnAWwG0ihzLDbnfKoW73tdM0DOHTTehOg7mOjtZjJ7BlvqBY0rPwUAYgVmYU8
         Y0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711566675; x=1712171475;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NMdyhQ5KQf+5t3j22eJ7oXRafJFy4NN7UKLX5AVnPI=;
        b=euW2KihHZeHzNse1abkW4kqQ4qPUq0ydVZzifeZvOIpcDmYHANyBZM2vdDkPKNUTvG
         tTC2qAoTbdpknCh1w5sPayYHEHbQtQXj8OTUw/nLgymBiHtAKUE110QuYhQZ/TbUB/wI
         LaRw40a4sOyIPG0FicTfH1qBRtbf9zg6xLb0HphqtjX60Dfj/SIfMoY7/fdM+fQtIrS9
         2evl67soe2cXWtFHiEiofthlBt/p4EZuEJb041kasFYWvyz5cc194DnKfJInx/Zeti/+
         f0RUxhvgBAzh5OBnN0f/B2h9O2Y7qFsB0xfhsyd8NfUApQp894lb2m+KtLAlRjGeY4Qi
         m9WA==
X-Gm-Message-State: AOJu0Yzy+EXI8IWefOnv63yALYR+yNwyIBQT6d6DZZJJw4o0/lQ7Gc1h
	iq6jgR9FY4XHLgZAdtBCT7WfJxYKvlbWu2nyufzCuwQZd6LewBoVfQC2c8zZ
X-Google-Smtp-Source: AGHT+IEdAAnLKUC0kZI/L7wSzmbI6/HrbX6SPWY41O4lcpeaZpHXoaAQfFDBIBKoQZkg5BQCb9kLuw==
X-Received: by 2002:a17:902:c083:b0:1e0:1a1f:5e4 with SMTP id j3-20020a170902c08300b001e01a1f05e4mr430245pld.55.1711566674587;
        Wed, 27 Mar 2024 12:11:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id mo12-20020a1709030a8c00b001db717d2dbbsm9446567plb.210.2024.03.27.12.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 12:11:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 27 Mar 2024 12:11:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: loongarch@lists.linux.dev
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com
Subject: Kernel BUG with loongarch and CONFIG_KFENCE and CONFIG_DEBUG_SG
Message-ID: <c352829b-ed75-4ffd-af6e-0ea754e1bf3d@roeck-us.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

when enabling both CONFIG_KFENCE and CONFIG_DEBUG_SG, I get the following
backtraces when running loongarch images in qemu.

[    2.496257] kernel BUG at include/linux/scatterlist.h:187!
...
[    2.501925] Call Trace:
[    2.501950] [<9000000004ad59c4>] sg_init_one+0xac/0xc0
[    2.502204] [<9000000004a438f8>] do_test_kpp+0x278/0x6e4
[    2.502353] [<9000000004a43dd4>] alg_test_kpp+0x70/0xf4
[    2.502494] [<9000000004a41b48>] alg_test+0x128/0x690
[    2.502631] [<9000000004a3d898>] cryptomgr_test+0x20/0x40
[    2.502775] [<90000000041b4508>] kthread+0x138/0x158
[    2.502912] [<9000000004161c48>] ret_from_kernel_thread+0xc/0xa4

The backtrace is always similar but not exactly the same. It is always
triggered from cryptomgr_test, but not always from the same test.

Analysis shows that with CONFIG_KFENCE active, the address returned from
kmalloc() and friends is not always below vm_map_base. It is allocated by
kfence_alloc() which at least sometimes seems to get its memory from an
address space above vm_map_base. This causes virt_addr_valid() to return
false for the affected objects.

I have only seen this if CONFIG_DEBUG_SG is enabled because sg_set_buf()
otherwise does not call virt_addr_valid(), but I found that many memory
allocation calls return addresses above vm_map_base, making this a
potential problem when running loongarch images with CONFIG_KFENCE enabled
whenever some code calls virt_addr_valid().

I don't know how to solve the problem, but I did notice that virt_to_page()
does handle situations with addr >= vm_map_base. Maybe a similar solution
would be possible for virt_addr_valid().

Thanks,
Guenter
