Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E48915852C
	for <loongarch@lists.linux.dev>; Fri, 30 Aug 2024 13:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725026238; cv=none; b=qtMrIKxuQcga9GgDG38vZiSrqw2NJjO/ia8xc7pY3zMXPPw2rqH3XzZ7zzh5HrkzNr7tKqsG4i18yoUbwLo4iFBzWtl9TCUcjyHdwqxiWCiMN6Vukf7eCUkjbFkESctIyfgmnaEXjVCOUaKgjXHAjnpQN6ZTYuq+CC2M/vckJsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725026238; c=relaxed/simple;
	bh=NUlKGhIyCsQGFAYIgqP91JPxVHe0dLUWSGpMcalpvoU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aJC1Svr0cbgBMm5JEJEXydmcO4MnUFBtGnC0jWcIlH6IwbKhTYd3ysw6BuWQoh9D3hnSSEglrSbiO6dH/gu/8DdLQhLgEQHtfWYhf0h2OrZSvg64h/hKks0Vy2rX3J1PoLMyAb1V1Q68Q+6gXWiVmlbXJ2l1IGuTI77QAefij1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vMh+sm6Q; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vMh+sm6Q"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2053f4938c7so1334945ad.2
        for <loongarch@lists.linux.dev>; Fri, 30 Aug 2024 06:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725026236; x=1725631036; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=58CvTL6COAyoekWQp05GB8r3Lb0Xc+vxoLW2O7LrDWY=;
        b=vMh+sm6QtmfVIxNYxov/sRAQaoUS1IreRIZIKzAzP14Mv9a3WTi02trVqFJph4ZnH+
         DqmJmwd7d8dLadHY7BcmuSHlYrhTmKUU7wdldxXPJy300plDwkBRmhNkt+kIeTi7muUX
         wWI0Omuf60BEhHOuHKaOkEQMLy775FtPKIpF5KED9hJ5lD9D/rqZ5uNejr+dIi8IANyE
         wv0zjbq80Z1oJ3wuu/HxSxOy2pblIRSh7+OInmNE8ZirI/sfu7pVmUqFhTmoGga99gmk
         Czj7qJIs2VPHHEj+JnwbLqnQI5RW/5IOcKYhKv04sxI+7xXxCMlc0SOO8ygwU/zS2aFz
         47UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725026236; x=1725631036;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58CvTL6COAyoekWQp05GB8r3Lb0Xc+vxoLW2O7LrDWY=;
        b=emC6yOQQCfXGp7P3EH6l2UKy3BpjMJ9dDCwz89JhG7FGTv2olAxd3Kf5Rbh/If48n6
         uz8qoIE9LOO5sPqjOb5Vz6/lpeKarijaaHaUvpDLVdy9PO7iHQPVYcGWQqO7Oeb2o5I5
         7rAslyb9iTb8tBvpUcoz7fN51mlHYJzA4IQBO8M9JEr1IB+EF534BsX3zsUKakt6zORT
         9G9BZnD+N2I+spGkgkxqyZeFWxixY3BYCaTa/rbwi9nxDIyQ3I1h80ehBOQIDBTs5T29
         VIk+/ET76h+2EkkDLuBu65B+S3tBP+QLJfsUMNyIxSr3SYuDLzjm4y7qwAQtN10mIR8q
         BTew==
X-Forwarded-Encrypted: i=1; AJvYcCXTwpR4dxzjwLZa3EG1iSyClsi8a54xG2LvPt8JjEntKWnY3bp1AGKFSgxviC4PvEYxS2N74UoBAJM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwW7kccEiq9O9dqJQJcG1HC21SG9Oh3YVHcht3HHXj2d1WrgCl8
	XI4tKRthgOJDOyX1ez8UnEUn0BUurSNe4hPfHoSt+DTBiMmhEUIS93+an/zbiTdfoIecSd333Zb
	GGQ==
X-Google-Smtp-Source: AGHT+IExGR2RCNKu/4M4z4IiNUcplAydPr67v3iYUD8ZfSJDuu52D1tVexWQwhZuKUP8XxVYEYjpc6MqNEc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f90b:b0:1fd:9d0c:999e with SMTP id
 d9443c01a7336-2052857ddfamr344725ad.9.1725026235523; Fri, 30 Aug 2024
 06:57:15 -0700 (PDT)
Date: Fri, 30 Aug 2024 06:57:14 -0700
In-Reply-To: <1f037b5604deb5f83f05e709b2edf3063372518f.camel@intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240830043600.127750-1-seanjc@google.com> <20240830043600.127750-2-seanjc@google.com>
 <1f037b5604deb5f83f05e709b2edf3063372518f.camel@intel.com>
Message-ID: <ZtHPusyTNkQ_a1Y-@google.com>
Subject: Re: [PATCH v4 01/10] KVM: Use dedicated mutex to protect
 kvm_usage_count to avoid deadlock
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"maz@kernel.org" <maz@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"anup@brainfault.org" <anup@brainfault.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Chao Gao <chao.gao@intel.com>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Farrah Chen <farrah.chen@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 30, 2024, Kai Huang wrote:
> 
> > Reviewed-by: Kai Huang <kai.huang@intel.com>
> > Acked-by: Kai Huang <kai.huang@intel.com>
> > 
> 
> Hmm I must have done a lot for me to receive two credits (and for most patches
> in this series) :-)
> 
> I think one Reviewed-by tag is good enough :-)

Heh, indeed.  b4 has made me very lazy; I just `b4 am` the patches and let b4
grab all the trailers.  I'm guessing something went awry in that flow (or maybe
you acked a previous version or something?)

Anyways, one of Paolo or I can clean this up when applying, assuming we remember
to do so...
