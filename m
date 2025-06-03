Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33FB30100
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748956002; cv=none; b=BhZCOMqKfbDgXSfAlUsKbeh5KBrz3oR3aHQdyTOIMnPWMB9lYTp2hu855gp+LmfxfBR5BhRA8FOSzRzNtkZlUBJnOYSAruSIVeyx13bdyrVZBbhBtNI/vikzDpFxEczfvF7i0h8s9gHww2pwPzNKJ8O/KbePYHX9q5GI2dw5C2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748956002; c=relaxed/simple;
	bh=BCr7GIiuUO2pKsPic3aDxYvqICfx1M5/86X3EyLcGx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M28dDHV4pgeVScK4eMYb/gxwPrVOeSx2RqGSmll9bMnVjJ6nVk3E6gUXbcUKmtGbJkLab8DP9FUFvEhmSi22kPWj3yDsVQAbqot4lZFxrcy5E+Wjgr5Bjloz2T7/3CAifH8nJvr7+P38b9WwurCmTisq0JCdxrws7l14YWCPZKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gngYYlzo; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gngYYlzo"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74267c68c11so4293145b3a.0
        for <loongarch@lists.linux.dev>; Tue, 03 Jun 2025 06:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748956000; x=1749560800; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/f20/458IAFhCzkUWgHcem7N3YGetstsrc6uh9Gjc8=;
        b=gngYYlzo2Es6RQV+zVyuqQA3XBaxwY69X5yypYVZXwVv0CNU3tfnW6ORA7qYEOH4S7
         7BGS+wQ5+nM47bYohE4niOKFRlIyaA2+LyQN1lZqbhUK1uRkUQrp/HTea8HxbF+HQPVJ
         BleoWMCGS5jQ/xtobmvfaoeR+vLtaLEzWX5Y2vdGl+SK7tMkhXzrnKSBKltvzvFzsxRP
         /cI3zV7TOp+GhcNwynQBkWgcTCvBTSYtIRxUbxC9F/rtU6XKvlzIURQ4dCtfTTJF6Ro+
         8ppImfWcbLA/hMaCuptpaWYHh2kwYKaLKobKi3mH6EBQXtBlKxTOYhehecIrQUELC7Ky
         Il8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748956000; x=1749560800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/f20/458IAFhCzkUWgHcem7N3YGetstsrc6uh9Gjc8=;
        b=eNVlKu7y3DrYf/SEVpOrMBmFg/gcmLCNTzgBTMMvQxhEb/k8aEx75/vvXnkarh7Rrz
         TUDiCTS3vDqOWSFwcmYNqeEUXBEODkhH5QY4yTW1/YRqpv3OvjM3bbNT6NsyuvP/Wokz
         VtfBvU9IOFMaHwQqj9LML183B4ECaD7Y0/UYSjq4pWJl05vDXMb+NUCE3H4+YdJA2I9A
         8WMVqq5b7LzOWCTq//ORxLG8ltN6RH1SJTgnRT7EeQ4elvmXens7zPaeAcpjLtIrzjpL
         6tKJIrFhtJHCw1WYREF0CZRQTchZY+3/zAgESIe4wcTs92WBf/Rj3/l6Z1hhjRjktO5B
         POCw==
X-Forwarded-Encrypted: i=1; AJvYcCV84VuWBT57Vse4DGyhk2B+yEBW9B4WUG8P+5aCpbGcctEk8UXzKY4M3Lh/eSM27WyKhsSc6ZDTBD4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7BPf//Z/wH/eWANqd+TejBM9vJIJ9xfTR3EOeaGimIO3O4J1h
	VmynaPtvpz0xvQW1KT4n0Ql5O60/BWP/53yZPztBXQqyHPEQXr0y7J3b
X-Gm-Gg: ASbGncsTc+8/DpJcoYicAg4I/Q6P+lM4Hyo9o0W7VsWzvgMXPEiTiSJx3gcRwD4irsS
	j1BA+d1dTs/NRaGWPzx68du9qy8dEXoxwcASwREpFoJOgeOlq2MIDjvNzu97iaFIss2GqOsB/c6
	WNEyNq3AbkMGiSgzKslBSU7bU1nZIDHen2qww4tGrPeudBeWdOviRMffeaPA+LNJv/n23j8IvnT
	LPLvRYQJzeU6WzNylYtr5lg16NvBCEkmRD46EIb7tT8/+9MYuo1ix88NRwN0oWvOD8keYEoHJL9
	ekCAJj/xNLYyFZjXsRpRhHkK6DWphoFxvDEHr+wkLo0K5R+kDqkaZtAaxaOJXd0m
X-Google-Smtp-Source: AGHT+IFS6CTlI8UpfHYxqjdx1tNG8cfSJRAGppMmlPcr/BiaoL+v48NartI8bBJjtEqQATncKxJnKQ==
X-Received: by 2002:a05:6a21:32a1:b0:1f5:9016:3594 with SMTP id adf61e73a8af0-21adff61278mr25343927637.18.1748955999729;
        Tue, 03 Jun 2025 06:06:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb6857sm6097535a12.73.2025.06.03.06.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:06:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Jun 2025 06:06:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
Cc: Jonathan.Cameron@huawei.com, dan.j.williams@intel.com, rppt@kernel.org,
	rafael@kernel.org, lenb@kernel.org, akpm@linux-foundation.org,
	alison.schofield@intel.com, rrichter@amd.com, bfaccini@nvidia.com,
	haibo1.xu@intel.com, david@redhat.com, chenhuacai@kernel.org,
	linux-cxl@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	chenbaozi@phytium.com.cn, loongarch@lists.linux.dev
Subject: Re: [PATCH v3 1/1] mm: numa_memblks: introduce
 numa_add_reserved_memblk
Message-ID: <06a0abfd-5508-4fb5-8a96-a13cf3d8aca7@roeck-us.net>
References: <20250508022719.3941335-1-wangyuquan1236@phytium.com.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508022719.3941335-1-wangyuquan1236@phytium.com.cn>

Hi,

On Thu, May 08, 2025 at 10:27:19AM +0800, Yuquan Wang wrote:
> acpi_parse_cfmws() currently adds empty CFMWS ranges to numa_meminfo
> with the expectation that numa_cleanup_meminfo moves them to
> numa_reserved_meminfo. There is no need for that indirection when it is
> known in advance that these unpopulated ranges are meant for
> numa_reserved_meminfo in support of future hotplug / CXL provisioning.
> 
> Introduce and use numa_add_reserved_memblk() to add the empty CFMWS
> ranges directly.
> 
> Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>

Just on case this has not been reported yet:

Building loongarch:defconfig ... failed
--------------
Error log:
drivers/acpi/numa/srat.c: In function 'acpi_parse_cfmws':
drivers/acpi/numa/srat.c:467:13: error: implicit declaration of function 'numa_add_reserved_memblk' 

Guenter
