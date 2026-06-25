Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A41F30EF97
	for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 18:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411950; cv=none; b=G25rAyGaLH/vC+48WQf9taXZ63+SjC7Sr+k7/QF2u5jBDQ6hy1ZrHMOMtv3qR4pvMCwHg1q9LR5YKpAqm2oYM/s81MQ61kalKV8crRZkIr1E142SfB2Zf3GjARUAw9PeGgu60N9UAYEhFjqKMwwzvs5SX4ZDX7aabGp40O6CRcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411950; c=relaxed/simple;
	bh=cJD1d8SS4YkFBeIsSThL0NMVfHMqUFfkKfh1Wvpcjiw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BSpNs7CwV7wHF3vxwicyr++H4kUUvFzefz8otnlMOm0mFriV4IlWWZR7aerpHpRSrd+XhmZ2NazYyF31Za9bB+2+dTXUMFZPfzo7ArEBPXC0xG1P/pO5ER1svEeZWWJxcvX74ntfYyE7UPzuv/GVjphg1HD239Zubjly/cjbipM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jAE1q0s/; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jAE1q0s/"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c6a3ece0d8so974285ad.3
        for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 11:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782411948; x=1783016748; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cJD1d8SS4YkFBeIsSThL0NMVfHMqUFfkKfh1Wvpcjiw=;
        b=jAE1q0s/Eq85E6vd//e1AL5IoQmWjVq4vzf27Wb1s4meStN+f/SwOeZkB7E5YGSzjA
         1SbL80AzxcC027MIyj9vOJ0znWCTz/JX4M73RDDlwOzMQlUa3MxigKK6Lz8wUs6GMlkS
         5zbWBTgDVjWDDeDQsgQ8L55Jiot2+KdYaGaPvu3C0tm2+wZX2byzl1VdHWGr44ol7OUC
         9+WUwak0dJm2vzxGJg9hgLQVWVqfNfZIe33YqpP+9B/Tr3lwELklBpfM0ZzEhGvkA+85
         ekzkm0qRWL4QRxotEFBa7tbA8vLsZA2WzbbzUChCTcoaWSSlZzNcsxF7EDoCIwAYBL0j
         O8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782411948; x=1783016748;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJD1d8SS4YkFBeIsSThL0NMVfHMqUFfkKfh1Wvpcjiw=;
        b=WP2OesVt/wOqxBG5p2mM3dby2JciTF8dv9p9Ty4lzWif0aalmJLTJ52jFcIvFpLP6B
         j8mE1QBHDBzWyvQ0IhDyVJNEQaPF/eLKQJh2X8Fr03Dulp1Htn7WZ/ShuOXZ2UThCtu7
         OEFfJw32jEi1zDcDDCJhG1eGNJVoE8pKk5IwEf4E09ONP/MCFCHkXv02BT+cZz3hV1jD
         c06m9vMN/bp02p1Nd5JKuQfmA23PyVafPcUQg9YkiwscIvTZzGV75PPiGiYVX/LKwMeV
         KJ+39kvmWYyEuBhcfbFZFRJ9ekAskGccqsQJE9CdvRQ/AAKqYbTbjxfQc2b+E3brnDb/
         FFLg==
X-Forwarded-Encrypted: i=1; AFNElJ/O0cKnmYqrbOvyt3OeIzh9z6RoDJvL9itqMwFg3PyoMD/ExBXmedHVLtP2Uo+QT3i+CiOvhX+51jg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTBTt9II2QDMVJ1KJiTZWvQWlOF2c8jGHd+nGyI+zm7cY0MUGL
	ny67m5b9UX3p/W6WPul5twPZrvvErw7a4NqgibRHMsQC9inejFEtRAcu+s3rCpnfDuSD6lrqoA3
	gdM8QUg==
X-Received: from pgbfe1.prod.google.com ([2002:a05:6a02:2881:b0:c92:f433:5ab0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:220c:b0:3b4:6cae:4a51
 with SMTP id adf61e73a8af0-3bd4ac5e2f8mr4530424637.11.1782411948176; Thu, 25
 Jun 2026 11:25:48 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:25:47 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-12-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-12-4fe8b602ff47@google.com>
Message-ID: <aj1yq6DFK-5WI9ey@google.com>
Subject: Re: [PATCH RFC 12/12] Documentation: KVM: Focus acquisition order
 section on preventing deadlocks
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, vannapurve@google.com, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, May 27, 2026, Ackerley Tng wrote:
> Now that the first sentence is already described in more detail in the new
> section on synchronization while managing guest faults, drop the first
> sentence.

Nope, nothing in that sections says anything about the role of
mn_active_invalidate_count.
