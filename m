Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793235493;
	b=gBDL1TL/505lh88wYWlAFS3CYqhmETTt6vSn5uqHPXHiezBuNgS+8fOeMInXmr5MI6b6
	 NswWTKNVDsm8G5yt8+H10DognS7nC5t4R/pnW3e4Wzyze79GketYvnt95tkDPm2Y7Az1D
	 xozMVtJOlTxHW/2PIjicsNgtPZstFqeV9ejF/pFnphqi5xjnZ9w/LhMaZwOC6RSbbWrY3
	 yipj9ISAW/+s0o+f8g6h+BWme2i/AtmfkgYSvU5hbb7RhxNkfu0Wkg8c3tTSWPvn2aaNX
	 breT3k41VRBaJylUScihgZRMHiJHRZZJSCkGQnacwjw/ch/i3GJh8XDBiHPmyDNB7/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793235493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MGY0Rqt9U0dIYToocgg3kUF7zpT8f/idrVBwF/VTivU=;
	b=TFI5rEcl3gOV0SpBeARdE/sdPdVNwAAvOxfi9/GCDfmbnp8mJl0dVzLUoKdJs9rZS2dN
	 btwbGjGhbsTzoSOS+r5xBbgxs2Q8/kQ3DnRvTq/F+VQ2RSyH4dDnI6O8eBVU36QL3jlOf
	 44FWlDoxU0hD4nR91B9BhYluPI3ZEX5tNfPJXGn8JLqME3i+AB5Lk8fmoocwCrTptsYRu
	 2x0qcYejLk6bMzckD56rqC8nfnP8v7VQ1loP6O+AobtBv6rEHfEniBtoacO8HNaGR6wc0
	 o9Y99zg0QUwca0Z/hECt2qoXFriIxVZC/a2Tu1ocjKrqvCd/S4Br91v9thO4R5HcK1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzEVWmpx;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D279606A31A
	for <loongarch@lists.linux.dev>; Thu, 29 Oct 2026 00:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D279606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzEVWmpx
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4550d8ab15so214920166b.2
        for <loongarch@lists.linux.dev>; Wed, 28 Oct 2026 17:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793235492; x=1793840292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGY0Rqt9U0dIYToocgg3kUF7zpT8f/idrVBwF/VTivU=;
        b=HzEVWmpxPS/qghs7mVBo+zQM1KgbQgQAC8GQBCsejXYQUJ5J7+xqLjWWUCjN55T/Y+
         lUfu9MiLucBjsK3WjPfc/1gDICgd9Y/Kidby3v6ArU/y2cmYwml+yRLuDzqw0jX516hk
         YW85NTjL5OlJfcCIQ5EC/lze8sq+TfSaSqQCY2AwC5KWa7cAOCO9sRjndk8QLBUR8BkK
         l6JTV6i3cB8EBtiNojbNGIyYVu3i8dRzvHMvo3mBU1ODRQgRKmswdFcwL7ZTj8TJwxgm
         h/lKm1FOAdcgbt4cMqvkp5+EW8lgzdRg7RywPfq3NJMRFSIgTeMEzc4OUHt/3vHSf3xv
         yF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793235492; x=1793840292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGY0Rqt9U0dIYToocgg3kUF7zpT8f/idrVBwF/VTivU=;
        b=Cnd72NAqFd4HywG/iR6tjC1oHicb4W1q7eNtq0TgKJJ5lJS9E67acP0CJ9vbAHPhQO
         cLzZxA+oNRxpkzX5/+3FxvKPKANmEaWnGEuE5gWM4vwpr6QsWIgdFUtS35BZvlpyP8s0
         TTM8YUGBlv93y4s5m9dBYjMqt9vhKHy2XG4bbdQkVvcpi38x1bpJ9SO4Ko9CTvIQLM/L
         8xdIud+30nCMR3h22NsXGJWqDEMdMXLtLvAr95deLVudgb3dA99/RvVuF3mEPMg4jKAO
         jHGiYagQvj/98XGFFpiqDpI1511bu+ZtTGdWYAeaWpD2jW5ERX0w8h34zDPtK0nXA3VP
         PeIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzifwf6XWw6WGwHTLMuZ49ogn3jWxzgS6HWd2lfjcOiPum+Ig4sA0g5VohUBLRZ3A5W+vsE5P1PcCc=@lists.linux.dev
X-Gm-Message-State: AFq9FYI/aRYKrHQNMIUlKSEGLWrxUYSwNDGLy/EfIsr55P4p00AWoOb1
	UY3wz2HvnxyFaMr/9WBMhkSlxXE8oS6pu3DGYrdzVPHZf5DJpEXjQAr9
X-Gm-Gg: AYBFou0sMP3lyCEGW4QsAcwq7UoRBOuAiGqGITSOp9Y0B0O3c0XEBu0bPEJnUdzfvJC
	ELSROSsNIz5fQHJ9u7eOL6dRuLfuRk4Ygzc9fcEC8MWNoko6S1SX+vcgPZsGf/v83M1H837rC1n
	wl2JrRcbLA/YgL7jMKlVuyn52Ui/WNmettfyeYBxh32e/SwhhqN74QXgEIEIwIOCANFwKTGe+64
	S4QFkZSSNGEK6k8IG8Ufn+4DL1+GM6OO1x2Wf2D36X268Tx219wBkmGBchwlPjYEob/dZCt6dCv
	sIKpZER3p26JGBx4fBlvea0HQsNDLtGBJQb8zV6JftdFJCHHZR9ZQI9d3QbVAOPhOT0+AbE2YuJ
	kica8BnCoMCic9wA8DadiE05LDD70s7191juCtdKTNkvhSVNMeCN7qaP1OVMpQGxtnjP9Eos80z
	aBSjxusxAH+VFJ197dDJn9FnwriG0k0Gowjv9owqzS+UlkBVN0BePWF7DUprSr2jdxPkT8XSoVG
	bfR3KAqXO7znMI32tbURlN8kIzBwR1XtX6PdvfYqnfsVziqy70iSgg2h8k/fo4LJphTbQGCa+qY
	s0R0o0/dfIj/bM4kZMELDpgwV9vLtfmWPpUrlyMVzKov/3lOKZfkEK825urEiN8JyR6o166DnbT
	XfBBr9tr5R7G9rE7QzCvJCnc6ttQuUxy0vjZ1Pl5cBmOAQFqgkdOFNSqptgijF9RNW727K3xifO
	D83K6dTeMZjS6pdXSMcT1VdJSmuNNbQJ9AkWwC
X-Received: by 2002:a17:907:72c3:b0:c49:b90a:988b with SMTP id a640c23a62f3a-c49bdf89bc9mr328062966b.49.1793235491600;
        Wed, 28 Oct 2026 17:58:11 -0700 (PDT)
Received: from localhost.localdomain (249-172-21-31.ftth.glasoperator.nl. [31.21.172.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66bd3asm668971966b.56.2026.10.28.17.58.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 17:58:10 -0700 (PDT)
From: Emir Beganovic <beganovic.emir@gmail.com>
To: Birger Koblitz <mail@birger-koblitz.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Eric Dumazet <edumazet@kernel.org>,
	Jianhui Xu <neuromoments@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH net-next v19 00/13] ax88179_178a: Add support for AX88179A-based chips
Date: Thu, 29 Oct 2026 01:58:09 +0100
Message-ID: <20261029005809.19405-1-beganovic.emir@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
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

Hi Birger,

I tested v19 on a Dell DA305 USB-C adapter. It has an AX88179A
(0b95:1790, bcdDevice 0x0200, FW 1.0.7.131) behind a VIA VL822 hub,
plugged into a Dell XPS 16 (Panther Lake). The peer is an Intel I225-V
behind a switch.

I built ax88179, libphy, phylink and ax88796b as modules for a 7.2.8
kernel. v19 needed two things on that base: a4e22e9253e7 and a backport
of genphy_{read,write}_mmd_c45() from the adin1140 series.

With the current driver in configuration 1 this adapter never gets a
link ("Failed to read reg index 0x0040: -32"). With v19:

- 1000/full link with flow control
- download 940-941 Mbit/s in nine runs. Upload was 937-941 in five of
  nine and lower in the other four, and I couldn't find why. Eight
  later runs with tracing on all averaged about 932.
- 1-byte TCP request/response around 190-200 us, against about 1.46 ms
  with cdc_ncm on the same port (its default 400 us TX timer)
- switching itself to configuration 1 when the device comes up in the
  CDC configuration
- 100M and 10M links
- VLAN with rx-vlan-offload on and off, and rx-vlan-filter dropping a
  VID that isn't configured
- multicast filtering and allmulti
- suspend/resume (s2idle) and wake-on-LAN with a magic packet

Two small things I noticed:

- "Switching to vendor mode" is printed twice, once per CDC interface,
  and before the netdev is registered, so it shows up as
  "(unnamed net_device) (uninitialized)".
- After a WoL wake the link goes down and up twice within about 2.5 s,
  where a normal resume shows a single link up. It comes back fine
  either way.

I only have this one adapter, so nothing on the other chips.

Tested-by: Emir Beganovic <beganovic.emir@gmail.com>

Thanks,
Emir
