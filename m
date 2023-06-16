Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5191213AD3
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 09:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B2FC433C8;
	Fri, 16 Jun 2023 09:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686907881;
	bh=afznl1xu2FedPHnZ6GwWLSsAYaSSpfgT68N9LhlDOIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q5FuMmbm4AOpRluSAcOrgFB9mR/QK8tv8sLf7JixuZSo1Mll4OFQ90Cije78Jlobu
	 ysKHLaT2DYlX5mONK/5jTL9w6Qlqp0BBAcijxNHV+EUkhisFgHRaFotu1Si+VxUx7H
	 FNwjype88qr+RSxR8vZkTdBo0sTuCM/++VV+rHOb4kZ8aEa+LqgQ5lrJiDFEs1ctzn
	 a+D8BTNNUp8Kzi9WEoxLNtzJiGLCyaOE7r+GAuy7YQmxCAUavuxxhacVQhMza2UTCy
	 v3GgOs7fOiiDEMTvS5USzacHRMFRXt0o0uTsW4+Y+QL2H/nhC/kKTX4mxVyKXL4aXK
	 12Ib22qcq+UZg==
Date: Fri, 16 Jun 2023 10:31:17 +0100
From: Will Deacon <will@kernel.org>
To: Bibo Mao <maobibo@loongson.cn>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH v4] PCI: Align pci memory space base address with page
 size
Message-ID: <20230616093116.GA10423@willie-the-truck>
References: <20230609022047.2195689-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609022047.2195689-1-maobibo@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Jun 09, 2023 at 10:20:47AM +0800, Bibo Mao wrote:
> Some PCI devices have only 4K memory space size, it is normal in general
> machines and aligned with page size. However some architectures which
> support different page size, default page size on LoongArch is 16K, and
> ARM64 supports page size varying from 4K to 64K.

Shouldn't we also select this new Kconfig option on arm64 then?

Will
