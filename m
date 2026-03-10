Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795B633B6D2
	for <loongarch@lists.linux.dev>; Tue, 10 Mar 2026 02:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108795; cv=none; b=OgEBwyUStQvGy8BNLv1djPDNYj6DWXGzS0j4ES4nurPK0Hy0ZI6xov2FC0kAa9e58jGgmcfiMwlKs86agfG9Ns27UeIjwNUqr6EN+mAJuUE3UPMwtxxHS2tyabB677bovsqjEqA8igjOMmbiEqMM5jvTcnRwTGqqh+ZSLAZsRgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108795; c=relaxed/simple;
	bh=1ROmmXzbNCiQ0bHU48N4Ll72y619B1NhI2NdEeFxvyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ggbpRdu2vbh0c95GAeZkWyomPd5fgXGGBxKFgUBEcyZjhCI9N+jIOzspjMvH14ZJweRJMh6/46QatPiJKBH6sVsi3mecAJhGunG/JSpGk4W6J+/GRuod4OX5MUrTX7zVWmlGdZe+Pd9J0JJHFj8VHLC5/S9zFUNg+Uz+uL8XiHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q9eTEjCJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q9eTEjCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773108793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aCV6AtrZqJOTKDcJoDwJvJmch/wh+FICVhihLLbm0gc=;
	b=Q9eTEjCJGTSIR0My6f7xooqePX+H8yKQJyD5pdHcxG5uhW2ivc2YpDBI2SBKcNBshPl83h
	YhaIRIT6ThlcFyLSP3yYbWlIYswr6swq3sbC301fIB2UWQsKrxN0HpZXZxH4ETZ1lAOjyM
	jUbZJ0DAmocdFYa9OQ4uQ28oQJNysbc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-397-0W-wL2VWPKuFFCHVPIHhug-1; Mon,
 09 Mar 2026 22:13:09 -0400
X-MC-Unique: 0W-wL2VWPKuFFCHVPIHhug-1
X-Mimecast-MFC-AGG-ID: 0W-wL2VWPKuFFCHVPIHhug_1773108784
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 810F31956050;
	Tue, 10 Mar 2026 02:13:01 +0000 (UTC)
Received: from localhost (unknown [10.72.112.10])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C06ED1800761;
	Tue, 10 Mar 2026 02:12:54 +0000 (UTC)
Date: Tue, 10 Mar 2026 10:12:45 +0800
From: Baoquan He <bhe@redhat.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, robh@kernel.org, saravanak@kernel.org,
	akpm@linux-foundation.org, vgoyal@redhat.com, dyoung@redhat.com,
	rdunlap@infradead.org, pmladek@suse.com, dapeng1.mi@linux.intel.com,
	kees@kernel.org, paulmck@kernel.org, lirongqing@baidu.com,
	fvdl@google.com, rppt@kernel.org, ardb@kernel.org,
	leitao@debian.org, sourabhjain@linux.ibm.com, jbohac@suse.cz,
	cfsworks@gmail.com, osandov@fb.com, tangyouling@kylinos.cn,
	ritesh.list@gmail.com, hbathini@linux.ibm.com,
	eajames@linux.ibm.com, songshuaishuai@tinylab.org,
	kevin.brodsky@arm.com, samuel.holland@sifive.com,
	vishal.moola@gmail.com, junhui.liu@pigmoral.tech, coxu@redhat.com,
	liaoyuanhong@vivo.com, fuqiang.wang@easystack.cn, brgerst@gmail.com,
	x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v8 0/5] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-ID: <aa9-HYdKT8MhAjhi@MiWiFi-R3L-srv>
References: <20260302035315.3892241-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260302035315.3892241-1-ruanjinjie@huawei.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 77JED54LbTiOfkPHggAsYhrv8QBIJNLj0EQRrsV9JL4_1773108784
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 03/02/26 at 11:53am, Jinjie Ruan wrote:
> The crash memory allocation, and the exclude of crashk_res, crashk_low_res
> and crashk_cma memory are almost identical across different architectures,
> This patch set handle them in crash core in a general way, which eliminate
> a lot of duplication code.
> 
> And add support for crashkernel CMA reservation for arm64 and riscv.
> 
> Rebased on v7.0-rc1.
> 
> Basic second kernel boot test were performed on QEMU platforms for x86,
> ARM64, and RISC-V architectures with the following parameters:
> 
> 	"cma=256M crashkernel=256M crashkernel=64M,cma"

The whole series looks good to me, thanks.

Acked-by: Baoquan He <bhe@redhat.com>

